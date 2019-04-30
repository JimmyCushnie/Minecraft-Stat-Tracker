// used for turning lines from Guide.txt into lines for new_sidebar.mcfunction

using System;
using System.Collections.Generic;
using System.Linq;

namespace Data_Pack_Formatter
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("enter the number of the first new random objective");

            int number = int.Parse(Console.ReadLine());

            Console.WriteLine("paste the lines from Guide.txt here. When you have pasted them all, enter 'done'.");

            List<string> lines = new List<string>();

            var line = Console.ReadLine();

            while (line != "done")
            {
                lines.Add(line);
                line = Console.ReadLine();
            }

            Console.WriteLine();
            Console.WriteLine();
            Console.WriteLine();

            foreach (var l in lines)
            {
                if (l.Contains('.'))
                {
                    var f = l.Split('.');

                    var name = f[0];
                    var id = f[f.Length - 1];

                    Console.WriteLine($"# {name}");
                    Console.WriteLine($"execute if score $random x = {number} n run scoreboard objectives setdisplay sidebar {id}");

                    number++;
                }
                else
                {
                    Console.WriteLine(l.Replace("\n", "").Replace("\r", ""));
                }

                Console.WriteLine();
            }

            Console.WriteLine();
            Console.WriteLine();
            Console.WriteLine();

            Console.WriteLine("done. Press any key to exit.");
            Console.ReadKey();
        }
    }
}
