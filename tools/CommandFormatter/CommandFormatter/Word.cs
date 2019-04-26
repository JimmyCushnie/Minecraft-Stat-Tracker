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
    }
}
