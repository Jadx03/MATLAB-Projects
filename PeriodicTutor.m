%Author: Jainam Dhruva
%Assignment : Periodic Tutor
%Course: EGR 102
%Purpose: The program checks if the element name and number entred are correct or not%


[~, periodicTable] = xlsread('periodicTable.xlsx');

%Creating a string array of element names called elementNames
elementNames =  string(periodicTable(:, 1));
%Create a string array of element symbols called symbols
symbols = string(periodicTable(:, 2));


    ReviewedElements = [];
    NumElements = 0;
    numCorrectSymbols = 0;
    numCorrectAtomicNum = 0;

disp('//----------------------\\');
disp('||  THE PERIODIC TUTOR  ||');
disp('\\----------------------//');

ReviewNumber = input('How many elements would you like to review? ');
    if ReviewNumber > 118
        fprintf ("Error: Invalid Number Of Elements. Enter a number less than 118. \n")
        ReviewNumber = input ( "Input the number of elements you want to review:");
    elseif ReviewNumber < 1
        fprintf (" Error: Invalid Number of Elements. Enter a number greater than equal to 1. \n")
         ReviewNumber = input ( "Input the number of elements you want to review:");
    end
fprintf('\n');

NumberofTrial = 0;

;

while NumberofTrial<ReviewNumber ;
   
    atomicNumber = randi(length(elementNames));
    
    ReviewedElements = [ReviewedElements, atomicNumber];
    
    NumElements = NumElements +1;
    name = elementNames(atomicNumber);
    ansSymbols = symbols (atomicNumber);
    
    fprintf ('The chemical element has a name of: %s\n', name);
    
    ElementsymbolInput = input( "        Input the element's symbol: ", 's');
    
        if ElementsymbolInput == ansSymbols
            disp('    That is correct!');
            numCorrectSymbols = numCorrectSymbols + 1  ;
        else 
            fprintf ('No, the correct answer is: %s\n', ansSymbols);        
        end
    
    ElementnumberInput = input( "    Input element's atomic number: ");
    
        if ElementnumberInput == atomicNumber        
            disp('    That is correct!');
            numCorrectAtomicNum = numCorrectAtomicNum + 1;
        else 
            fprintf ('        No, the correct answer is: %d\n',atomicNumber);
        end
    
    NumberofTrial = NumberofTrial + 1;
   
    %pausing the code for the user
    pause (.5);
    %breaking to a new line for the required output
    fprintf ('\n');
end

PercentCorrectSymbol = (numCorrectSymbols/length(ReviewedElements)*100);
PercentCorrectNumber = (numCorrectAtomicNum/length(ReviewedElements)*100);




fprintf ('//-------------------------------------------\\ \n' );
fprintf ('|| SESSION REVIEW                            ||  \n');
fprintf ('||-------------------------------------------|| \n');
fprintf ('|| Number of Elements Reviewed:  %2d          ||\n',length(ReviewedElements));
fprintf ('|| Correct Element Symbols:      %2d (%5.1f%%) ||\n',numCorrectSymbols,PercentCorrectSymbol);
fprintf ('|| Correct Atomic Numbers:       %2d (%5.1f%%) ||\n',numCorrectAtomicNum,PercentCorrectNumber);
fprintf ('||-------------------------------------------|| \n');
fprintf ('|| REVIEWED ELEMENTS                         || \n');
fprintf ('||-------------------------------------------|| \n');

for k = (1:length(ReviewedElements))
    atomicNumber = ReviewedElements(k);
    name = elementNames(atomicNumber);
    fprintf ('|| %-3.0f %-13s                         ||\n',atomicNumber, name);
end 
fprintf    ('\\\\-------------------------------------------//\n');

disp    ('Thank you for using the Periodic Tutor!');