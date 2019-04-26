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
                            DisplayName = $"{Plural(itemName)} Broken";         // "Diamond Pickaxes Broken"
                            break;

                        case "minecraft.crafted":
                            if (itemName.IsBlock())
                                DisplayName = $"{itemName} Crafted";            // "Stone Crafted"
                            else
                                DisplayName = $"{Plural(itemName)} Crafted";    // "Diamond Pickaxes Crafted"
                            break;

                        case "minecraft.custom":
                            DisplayName = $"{itemName}";
                            break;

                        case "minecraft.dropped":
                            if (itemName.IsBlock())
                                DisplayName = $"{itemName} Dropped";            // "Stone Dropped"
                            else
                                DisplayName = $"{Plural(itemName)} Dropped";    // "Diamond Pickaxes Dropped"
                            break;

                        case "minecraft.killed":
                            DisplayName = $"{Plural(itemName)} Killed";         // "Skeletons Killed"
                            break;

                        case "minecraft.killed_by":
                            DisplayName = $"Deaths by {itemName}";              // "Deaths by Skeleton"
                            break;

                        case "minecraft.mined":
                            DisplayName = $"{itemName} Mined";                  // "Stone Mined"
                            break;

                        case "minecraft.picked_up":
                            if (itemName.IsBlock())
                                DisplayName = $"{itemName} Picked Up";          // "Stone Picked Up"
                            else
                                DisplayName = $"{Plural(itemName)} Picked Up";  // "Diamond Pickaxes Picked Up"
                            break;

                        case "minecraft.used":
                            if (itemName.IsBlock())
                                DisplayName = $"{itemName} Placed";             // "Stone Placed"
                            else
                                DisplayName = $"{itemName} Uses";               // "Diamond Pickaxe Uses"
                            break;
                    }

                    string Plural(string single)
                    {
                        if (single[single.Length - 1] == 's') return single;
                        return single + 's';
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
