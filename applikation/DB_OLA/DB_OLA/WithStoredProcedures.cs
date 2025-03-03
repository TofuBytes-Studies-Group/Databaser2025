using System;
using MySql.Data.MySqlClient;

class WithStoredProcedures
{
    private static string connectionString = "Server=localhost;Database=esport_assignment;User ID=root;Password=password;";

    public static void Run()
    {
        Console.WriteLine("Choose action:");
        Console.WriteLine("1. Join Tournament");
        Console.WriteLine("2. Submit Match Result");
        Console.Write("Enter choice: ");
        string action = Console.ReadLine();

        if (action == "1")
        {
            JoinTournament();
        }
        else if (action == "2")
        {
            SubmitMatchResult();
        }
        else
        {
            Console.WriteLine("Invalid choice.");
        }
    }

    private static void JoinTournament()
    {
        using (MySqlConnection conn = new MySqlConnection(connectionString))
        {
            conn.Open();
            Console.Write("Enter Tournament ID: ");
            int tournamentId = int.Parse(Console.ReadLine() ?? "0");

            Console.Write("Enter Player ID: ");
            int playerId = int.Parse(Console.ReadLine() ?? "0");

            using (MySqlCommand cmd = new MySqlCommand("CALL joinTournament(@TournamentID, @PlayerID);", conn))
            {
                cmd.Parameters.AddWithValue("@TournamentID", tournamentId);
                cmd.Parameters.AddWithValue("@PlayerID", playerId);
                cmd.ExecuteNonQuery();
            }

            Console.WriteLine("Joined tournament using stored procedure.");
        }
    }

    private static void SubmitMatchResult()
    {
        using (MySqlConnection conn = new MySqlConnection(connectionString))
        {
            conn.Open();
            Console.Write("Enter Match ID: ");
            int matchId = int.Parse(Console.ReadLine() ?? "0");

            Console.Write("Enter Winner Player ID: ");
            int winnerId = int.Parse(Console.ReadLine() ?? "0");

            using (MySqlCommand cmd = new MySqlCommand("CALL submitMatchResult(@WinnerID, @MatchID);", conn))
            {
                cmd.Parameters.AddWithValue("@WinnerID", winnerId);
                cmd.Parameters.AddWithValue("@MatchID", matchId);
                cmd.ExecuteNonQuery();
            }

            Console.WriteLine("Match result submitted using stored procedure.");
        }
    }
}
