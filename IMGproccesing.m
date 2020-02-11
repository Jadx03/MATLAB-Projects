%%
Im= imread('Coins2.jpg');
imshow(Im);





%%
    I_Red = Im (:,:,1);
  
    I_Green = Im (:,:,2);
    
    I_Blue = Im (:,:,3);
            subplot(2,2,1), imshow(I_Red);
           title ('Red Plane');
           subplot(2,2,2), imshow(I_Green);
           title ('Green Plane');
           subplot(2,2,3), imshow(I_Blue);
           title ('Blue Plane');
           subplot(2,2,4), imshow(Im);
           title ('Original');
           
%%
levelr = .7568; 
levelg = .75; 
levelb = .65; 

ThrRed = imbinarize(I_Red, levelr); 
 ThrGreen = imbinarize(I_Green, levelg);
   ThrBlue = imbinarize(I_Blue, levelb);
   
      ThrSum = (~ThrRed&~ThrGreen&~ThrBlue);  
   
      subplot(2,2,1), imshow(ThrRed);
          title ('Red Threshold');
          subplot(2,2,2), imshow(ThrGreen);
          title ('Green Threshold');
         subplot(2,2,3), imshow(ThrBlue);
         title ('Blue Threshold');
         subplot(2,2,4), imshow(ThrSum);
          title ('Sum of Thresholds');
          
          
          
         %%
          [centers, radii] = imfindcircles(ThrSum,[22 29]); 
             %%
          
              Penny = 0;
            PennySize = 23;   %make sure you place these values in as radii   
            Nickel = 0;
            NickelSize = 24;
            Quarter = 0 ;
            QuarterSize =28; 
            Dime = 0 ;
            DimeSize =22.5;
          
            
             AllCoins = length(radii);
               for index = 1:AllCoins
                coin = radii(index);
              
                if coin >= QuarterSize
                Quarter = Quarter + 1;
 
                elseif   coin >= NickelSize
                    Nickel=Nickel + 1; 
                    
                elseif coin >= PennySize
                    Penny= Penny + 1;
                
                elseif coin >= DimeSize
                    Dime= Dime + 1;
                end 
               end 
            
          changeQ = Quarter * 25
          changeN= Nickel * 5
          changeP = Penny *1 
          changeD = Dime * 10
          
          TotalChange= changeQ + changeN + changeP + changeD
          
          fprintf("There are %.f cents in the picture.", TotalChange);
          
          
          %%
          subplot(2,2,1), imshow(Im);
          title ('original');
          subplot(2,2,2), imshow(ThrGreen);
          title ('Threshold Green');
          subplot(2,2,3), imshow(ThrSum);
          title ('Combined Thresholds')
          subplot(2,2,4), imshow(Im)
          title ([num2str(TotalChange), ' cents']);
          c= viscircles(centers,radii);