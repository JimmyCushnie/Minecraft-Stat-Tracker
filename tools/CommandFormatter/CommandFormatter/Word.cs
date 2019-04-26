using System.Collections.Generic;

namespace CommandFormatter
{
    class Word
    {
        public string single;
        public string plural;

        public static implicit operator Word((string, string) tuple)
            => new Word()
            {
                single = tuple.Item1,
                plural = tuple.Item2,
            };

        public static implicit operator Word(string name)
            => new Word()
            {
                single = name,
                plural = name,
            };

        public override string ToString()
            => single;
    }
}
