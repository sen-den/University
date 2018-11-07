using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ConsoleApp1
{
    class Program
    {
        static void Main(string[] args)
        {
            double a, b, result;
            char operation;

            do
                a = int.Parse(Console.ReadLine());
                b = int.Parse(Console.ReadLine());
                operation = char.Parse(Console.ReadLine());
                result = 0;

                switch (operation)
                {
                    case '+':
                        result = a + b;
                        break;
                    case '-':
                        result = a - b;
                        break;
                    case '*':
                        result = a * b;
                        break;
                    case '/':
                        result = a / b;
                        break;
                }

                Console.WriteLine(result);

            while (true);
        }
    }
}
