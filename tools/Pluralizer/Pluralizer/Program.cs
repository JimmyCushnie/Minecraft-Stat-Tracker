// some of the objectives require item names in singular form, some require them in plural form. This is a quick and dirty tool to generate c# sytnax that represents both forms.
// it's not perfect and needs to be manually cleaned up.

using System;
using System.Collections.Generic;
using System.Data.Entity.Design.PluralizationServices;
using System.Globalization;
using System.IO;

namespace Pluralizer
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Enter path to file with item IDs and names");
            var path = Console.ReadLine();
            var lines = File.ReadAllLines(path);

            Console.WriteLine();
            Console.WriteLine();
            Console.WriteLine();

            var pluralizer = PluralizationService.CreateService(CultureInfo.CurrentCulture);

            foreach (var line in lines)
            {
                int colonIndex = line.IndexOf(':');
                var beforeColon = line.Substring(0, colonIndex);
                var afterColon = line.Substring(colonIndex + 1);

                Console.WriteLine($@"[""{beforeColon}""]".PadRight(50) + $@" = (""{afterColon}"", ""{pluralizer.Pluralize(afterColon)}""),");
            }

            Console.WriteLine();
            Console.WriteLine();
            Console.WriteLine();

            Console.WriteLine("done. Press any key to close.");
            Console.ReadKey();
        }
    }
}
