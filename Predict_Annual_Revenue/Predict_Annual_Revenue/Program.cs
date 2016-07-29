using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Collections;

namespace Predict_Annual_Revenue
{
    class Program
    {
        static void InputData(ArrayList temp, string fileAddress)           //CSV File Input Method
        {
            var reader = new StreamReader(File.OpenRead(fileAddress));

            while (!reader.EndOfStream)
            {
                var line = reader.ReadLine();
                var values = line.Split(',');

                temp.Add(values);
            }

        }

        static void DisplayData(ArrayList temp)                             //CSV File Output Method
        {
            foreach (string[] str in temp)
            {
                Console.WriteLine();
                foreach (string s in str)
                    Console.Write(s+"  ");
            }
        }

        static void DisplayData(ArrayList temp, int num)                    //Overloaded CSV File Output Method
        {

            foreach (string[] str in temp)
            {
                Console.WriteLine();
                foreach (string s in str)
                    Console.Write(s + "  ");
                if (num-- == 0)
                    break;
            }
        }

        static void Main(string[] args)
        {
            ArrayList HospitalProfiling = new ArrayList();
            ArrayList HospitalRevenue = new ArrayList();
            ArrayList ProjectedRevenue = new ArrayList();
            ArrayList Solution = new ArrayList();

            InputData(HospitalProfiling,@"C:\Users\achal.goel\Downloads\data\HospitalProfiling.csv");

            InputData(HospitalRevenue, @"C:\Users\achal.goel\Downloads\data\HospitalRevenue.csv");

            InputData(ProjectedRevenue, @"C:\Users\achal.goel\Downloads\data\ProjectedRevenue.csv");

            InputData(Solution, @"C:\Users\achal.goel\Downloads\data\Solution.csv");
            DisplayData(Solution, 10);
            HospitalProfiling.RemoveAt(0);
            int temp;
            var obj = Solution[1];
            //foreach(var v in obj)

            List<int> HospitalSize = new List<int>();
  
            int j;

            foreach (string[] str in HospitalProfiling)
            {
                j =0;
                temp = Int32.Parse(str[2]);
                var newString = new string[4];
                newString[0] = str[0];
                newString[1] = str[1];
                newString[2] = str[2];
                if (temp < 10)
                {                 
                    newString[3] = "1";
                    HospitalProfiling[j] = newString;
                } 
                j++;
            }

            DisplayData(Solution, 10);
            
            
            Console.ReadKey();
       
        }
    }
}
