using System;
using Microsoft.VisualBasic.FileIO; 

namespace ConsoleApplication
{
    public class Program
    {   
	  
        public static void Main(string[] args)
        {
            var shell = "#->";
            string shellInput; 
  
            Console.WriteLine("FRC-DataCompiler 1.0");
	    Console.WriteLine("FRC-StrongHold Build");
	    Console.WriteLine("Welcome Titan!");  
            shellInput = Console.ReadLine();
            Commander(shellInput); 
        }
        public static void Commander(string Input)
        {
            if (Input.Contains("report"))
            {
                Console.WriteLine("Reporting...");
                CSVparser(); 
            }
            else if (Input.Contains("help"))  
            {
		Console.Write(helpDoc); 
            }
        }
        public static void CSVparser() 
	    {
            
    extFieldParser parser = new TextFieldParser(@"Documents/output.csv");
			List<string[]> parsedData = new List<string[]>();
			string[] fields;
			parser.TextFieldType = FieldType.Delimited;
			parser.SetDelimiters(",");
			while (!parser.EndOfData) 
			{
				//Processing row
				fields = parser.ReadFields();
				foreach (string field in fields) 
				{
					fields = parser.ReadFields();
					parsedData.Add(fields);
					//TODO: Process field
				}
			}
			// Data Returned 
			Console.Write(parsedData); 
			parser.Close();
  
	    }
    }

  }
