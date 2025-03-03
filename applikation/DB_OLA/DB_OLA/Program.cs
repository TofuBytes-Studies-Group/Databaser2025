using System;

class Program
{
    static void Main()
    {
        while (true)
        {
            Console.WriteLine("Greetings Tine - Welcome to our pee pee poopy application please Choose mode:");
            Console.WriteLine("1. Use Stored Procedures");
            Console.WriteLine("2. Use Direct Queries (No Procedures)");
            Console.WriteLine("3. End the applications poor life :)");
            Console.Write("Enter choice: ");
            string choice = Console.ReadLine();

            if (choice == "1")
            {
                WithStoredProcedures.Run();
            }
            else if (choice == "2")
            {
                WithoutStoredProcedures.Run();
            }
            else if (choice == "3")
            {
                break;
            }
            else
            {
                Console.WriteLine("Invalid choice.");
            }
        }
    }
}