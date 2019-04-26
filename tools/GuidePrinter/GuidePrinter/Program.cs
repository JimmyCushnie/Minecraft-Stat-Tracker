// This is the program I used to generate Guide.txt.

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.IO;

namespace GuidePrinter
{
    static class Program
    {
        static void Main()
        {
            Console.WriteLine("Enter path to commands file");
            var path = Console.ReadLine();
            var lines = File.ReadAllLines(path);

            var newFileLines = new List<string>();
            for (int i = 0; i < lines.Length; i++)
            {
                var line = lines[i];
                bool lineContainsData = true;

                if (string.IsNullOrWhiteSpace(line)) lineContainsData = false;
                if (line.StartsWith("#")) lineContainsData = false;

                if (lineContainsData)
                {
                    var space3 = line.IndexOfNth(" ", 3);
                    var space4 = line.IndexOfNth(" ", 4);
                    var space5 = line.IndexOfNth(" ", 5);

                    var ID = line.Substring(space3 + 1, space4 - space3 - 1);
                    var name = line.Substring(space5 + 1);

                    name = name.Substring(1, name.Length - 2); // remove quotes from either end

                    line = name.PadRight(50, '.') + ID;
                }

                newFileLines.Add(line);
            }

            Console.WriteLine("Done generating guide file. Press any key to print.");
            Console.ReadKey();

            Console.WriteLine();
            Console.WriteLine();
            Console.WriteLine();

            foreach (var line in newFileLines)
                Console.WriteLine(line);

            Console.WriteLine();
            Console.WriteLine();
            Console.WriteLine();

            Console.WriteLine("Done printing. Press any key to exit.");
            Console.ReadKey();
        }

        static int IndexOfNth(this string str, string value, int nth = 1)
        {
            if (nth <= 0)
                throw new ArgumentException("Can not find the zeroth index of substring in string. Must start with 1");
            int offset = str.IndexOf(value);
            for (int i = 1; i < nth; i++)
            {
                if (offset == -1) return -1;
                offset = str.IndexOf(value, offset + 1);
            }
            return offset;
        }
    }
}
