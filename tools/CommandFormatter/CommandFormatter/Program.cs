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
            Console.WriteLine("Please enter the location of ValidCriteria.txt");
            var location = Console.ReadLine();

            var lines = File.ReadAllLines(location);
            var commands = new List<string>();

            foreach (string line in lines)
            {
                if (String.IsNullOrWhiteSpace(line)) continue;
                if (line[0] == '#') continue; // allow comments

                string DisplayName = "YOU NEED TO INSERT A NAME HERE";

                int colonIndex = line.IndexOf(':');
                if (colonIndex > 0)
                {
                    var beforeColon = line.Substring(0, colonIndex);
                    var afterColon = line.Substring(colonIndex + 1);

                    if (!Items.TryGetValue(afterColon, out var itemName))
                    {
                        Console.WriteLine($"No dictionary value for {afterColon}. Please enter one now.");
                        var newName = Console.ReadLine();
                        itemName = newName;
                        Items.Add(afterColon, newName);
                    }

                    switch (beforeColon)
                    {
                        case "minecraft.broken":
                            DisplayName = $"{itemName}s Broken";
                            break;

                        case "minecraft.crafted":
                            DisplayName = $"{itemName}s Crafted";
                            break;

                        case "minecraft.custom":
                            DisplayName = $"{itemName}";
                            break;

                        case "minecraft.dropped":
                            DisplayName = $"{itemName}s Dropped";
                            break;

                        case "minecraft.killed":
                            DisplayName = $"{itemName}s Killed";
                            break;

                        case "minecraft.killed_by":
                            DisplayName = $"Deaths by {itemName}";
                            break;

                        case "minecraft.mined":
                            DisplayName = $"{itemName} Mined";
                            break;

                        case "minecraft.picked_up":
                            DisplayName = $"{itemName} Picked Up";
                            break;

                        case "minecraft.used":
                            DisplayName = $"{itemName} Uses";
                            break;
                    }
                }

                var name = DisplayName.Replace(" ", ""); // remove spaces
                name = Char.ToLowerInvariant(name[0]) + name.Substring(1); // make the first character lowercase. I'm making names camelCase

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
    }
}
