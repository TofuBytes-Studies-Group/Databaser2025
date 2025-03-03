using System;
using MySql.Data.MySqlClient;

class WithoutStoredProcedures
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

            string query = "INSERT INTO Tournament_Registrations (tournament_id, player_id) VALUES (@TournamentID, @PlayerID);";
            using (MySqlCommand cmd = new MySqlCommand(query, conn))
            {
                cmd.Parameters.AddWithValue("@TournamentID", tournamentId);
                cmd.Parameters.AddWithValue("@PlayerID", playerId);
                cmd.ExecuteNonQuery();
            }

            Console.WriteLine("Joined tournament using direct SQL.");
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

            string query = "UPDATE Matches SET winner_id = @WinnerID WHERE match_id = @MatchID;";
            using (MySqlCommand cmd = new MySqlCommand(query, conn))
            {
                cmd.Parameters.AddWithValue("@WinnerID", winnerId);
                cmd.Parameters.AddWithValue("@MatchID", matchId);
                cmd.ExecuteNonQuery();
            }

            Console.WriteLine("Match result submitted using direct SQL.");
        }
    }
}
