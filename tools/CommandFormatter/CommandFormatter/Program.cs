// Parses objective criteria into commands with a name and display name.

using System;
using System.IO;
using System.Collections.Generic;

namespace CommandFormatter
{
    static partial class Program
    {
        static void Main()
        {
            Console.WriteLine("Enter path to file with objective criteria");
            var path = Console.ReadLine();

            var lines = File.ReadAllLines(path);
            var commands = new List<string>();

            foreach (string line in lines)
            {
                if (String.IsNullOrWhiteSpace(line)) continue;
                if (line[0] == '#') continue; // allow comments

                string DisplayName = "YOU NEED TO INSERT A NAME HERE";
                string name = "NAME_GOES_HERE";

                int colonIndex = line.IndexOf(':');
                if (colonIndex > 0)
                {
                    var beforeColon = line.Substring(0, colonIndex);
                    var afterColon = line.Substring(colonIndex + 1);

                    if (!Words.TryGetValue(afterColon, out var word))
                    {
                        Console.WriteLine($"No dictionary value for {afterColon}. Please enter singular:");
                        var newName = Console.ReadLine();
                        Console.WriteLine("Please enter plural:");
                        var newNamePlural = Console.ReadLine();

                        word = (newName, newNamePlural);
                        Words.Add(afterColon, (newName, newNamePlural));
                    }

                    string id = word.single.FirstCharacterLowercase();
                    switch (beforeColon)
                    {
                        case "minecraft.broken":
                            name = $"brk_{id}";
                            DisplayName = $"{word.plural} Broken";
                            break;

                        case "minecraft.crafted":
                            name = $"crf_{id}";
                            DisplayName = $"{word.plural} Crafted";
                            break;

                        case "minecraft.custom":
                            name = $"{word}";
                            DisplayName = $"{word}";
                            break;

                        case "minecraft.dropped":
                            name = $"drp_{id}";
                            DisplayName = $"{word.plural} Dropped";
                            break;

                        case "minecraft.killed":
                            name = $"kil_{id}";
                            DisplayName = $"{word.plural} Killed";
                            break;

                        case "minecraft.killed_by":
                            name = $"die_{id}";
                            DisplayName = $"Deaths by {word}";
                            break;

                        case "minecraft.mined":
                            name = $"min_{id}";
                            DisplayName = $"{word.plural} Mined";
                            break;

                        case "minecraft.picked_up":
                            name = $"pic_{id}";
                            DisplayName = $"{word.plural} Picked Up";
                            break;

                        case "minecraft.used":
                            name = $"use_{id}";
                            if (afterColon.IsBlock())
                                DisplayName = $"{word.plural} Placed";
                            else
                                DisplayName = $"{word} Uses";
                            break;
                    }
                }
                
                name = name.CapLength(16); // max length for an objective name is 16, which is bullshit
                name = name.Replace(" ", "");
                name = name.FirstCharacterLowercase();

                commands.Add($"scoreboard objectives add {name} {line} \"{DisplayName}\"");
            }

            Console.WriteLine($"Done, generated {commands.Count} commands. Press any key to print them.");
            Console.ReadKey();
            Console.WriteLine();
            Console.WriteLine();

            foreach (var command in commands)
                Console.WriteLine(command);

            Console.WriteLine();
            Console.WriteLine();
            Console.WriteLine("Press any key to exit");
            Console.ReadKey();
        }

        static string CapLength(this string s, int maxLength)
            => (s.Length <= maxLength) ? s : s.Substring(0, maxLength);

        static string FirstCharacterLowercase(this string s)
            => Char.ToLowerInvariant(s[0]) + s.Substring(1);
    }
}
