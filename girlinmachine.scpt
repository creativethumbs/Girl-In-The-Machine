set gregoryFile to name of (info for "/Users/tichaseth/Desktop/Girl in the Machine/home/first floor/living room/computer.jpg")
set sushiFile to name of (info for "/Users/tichaseth/Desktop/Girl in the Machine/home/second floor/master bedroom/sushi.jpg")
set beatlesFile to name of (info for "/Users/tichaseth/Desktop/Girl in the Machine/car/sgt peppers.jpg")
set mompianoFile to name of (info for "/Users/tichaseth/Desktop/Girl in the Machine/home/first floor/main hall/piano.jpg")
set pianoFile to name of (info for "/Users/tichaseth/Desktop/Girl in the Machine/home/first floor/main hall/piano .jpg")

set momparkFile to name of (info for "/Users/tichaseth/Desktop/Girl in the Machine/home/second floor/master bedroom/closet /door to attic/box /small box/park.jpg")

set momdisneyFile to name of (info for "/Users/tichaseth/Desktop/Girl in the Machine/home/second floor/master bedroom/closet /door to attic/box /small box/disney.jpg")

set momdrawing to name of (info for "/Users/tichaseth/Desktop/Girl in the Machine/home/second floor/guest bedroom/bed/pillow/drawing.jpeg")

set atticFolder to name of (info for "/Users/tichaseth/Desktop/Girl in the Machine/home/second floor/master bedroom/closet ")

set atticdoorFolder to name of (info for "/Users/tichaseth/Desktop/Girl in the Machine/home/second floor/master bedroom/closet /door to attic")

set closetFolder to name of (info for "/Users/tichaseth/Desktop/Girl in the Machine/home/second floor/my bedroom/closet")

set cokecanFolder to name of (info for "/Users/tichaseth/Desktop/Girl in the Machine/home/second floor/master bedroom/closet /door to attic/box        /coke can")

set oldHWFolder to name of (info for "/Users/tichaseth/Desktop/Girl in the Machine/home/first floor/dad's office/Box/Old hw") 

set booksFolder to name of (info for "/Users/tichaseth/Desktop/Girl in the Machine/home/second floor/bookshelf")

set atticvisits to 0

repeat
  if (get name of every window of application "Finder") contains atticFolder and (get name of every window of application "Finder") does not contain atticdoorFolder then
    tell app "System Events"
      if (atticvisits < 6) 
        delay 0.5
        keystroke "w" using {command down} -- closes window
      end if

      if atticvisits = 0 then
        say "What are you doing here?" without waiting until completion
        display dialog "What are you doing here?" buttons {"OK"}
        set atticvisits to 1

      else if atticvisits = 1 then 
        say "There's nothing for you here." without waiting until completion
        display dialog "There's nothing for you here." buttons {"OK"}
        set atticvisits to 2

      else if atticvisits = 2 then  
        display dialog "....................." buttons {"OK"}
        set atticvisits to 3

      else if atticvisits = 3 then  
        do shell script "(cd arduino-serial && ./arduino-serial -b 9600 -p /dev/cu.usbmodem1461 -s 2)"
        do shell script "(cd arduino-serial && ./arduino-serial -b 9600 -p /dev/cu.usbmodem1411 -s 0)"

        say "Why do you keep coming back? Why won't you just let it go?" without waiting until completion
        display dialog "Why do you keep coming back? Why won't you just let it go?" buttons {"(Let go)","(Don't let go)"}

        if result = {button returned:"(Let go)"} then
          say "Then go away." without waiting until completion
          display dialog "Then go away." buttons {"OK"}

        else if result = {button returned:"(Don't let go)"} then
          say "Well, it's none of your fucking business. You don't need to keep coming back here." without waiting until completion
          display dialog "Well, it's none of your fucking business. You don't need to keep coming back here." buttons {"OK"}
        end if

        set atticvisits to 4

      else if atticvisits = 4 then  
        display dialog "................................................................................................................................................................................................................................................" buttons {"..."}

        say "You really want to know what's in here, huh?" without waiting until completion
        display dialog "You really want to know what's in here, huh?" buttons {"..."}

        display dialog "..." buttons {"..."} giving up after 2

        say "Fine. You can go ahead." without waiting until completion
        display dialog "Fine. \n\nYou can go ahead." buttons {"OK"}
        set atticvisits to 6

      end if
    end tell

  else if (get name of every window of application "Finder") contains cokecanFolder then 
    tell app "System Events"
      delay 0.5

      say "What do you expect to find in here?" without waiting until completion
      display dialog "What do you expect to find in here!?" buttons {"OK"}

      delay 0.5
      tell app "Finder" to close window 1
    end tell

  else if (get name of every window of application "Finder") contains booksFolder then 
    tell app "System Events"
      delay 0.5 

      say "I was really into animals when I was little. We had this huge animal encyclopedia that I red from cover to cover. It was my favorite." without waiting until completion
      display dialog "I was really into animals when I was little. We had this huge animal encyclopedia that I read from cover to cover. It was my favorite." buttons {"Is that the one on the shelf?"}

      tell app "Preview"
        open "/Users/tichaseth/Desktop/Girl in the Machine/home/second floor/bookshelf/EAA.gif"
        activate
      end tell

      say "Yup, that's the one." without waiting until completion
      display dialog "Yup, that's the one." buttons {"OK"}

      delay 3

      display dialog "..." buttons {"..."} giving up after 2

      say "You know, I used to draw nothing but animals. One day my mom was watching me draw and asked me if I could do people for a change." without waiting until completion
      display dialog "You know, I used to draw nothing but animals.\n\nOne day my mom was watching me draw and asked me if I could do people for a change." buttons {"..."}

      say "I only draw people now." without waiting until completion
      display dialog "I only draw people now." buttons {"OK"}

      --blow fan
      do shell script "(cd arduino-serial && ./arduino-serial -b 9600 -p /dev/cu.usbmodem1411 -s 4)"

      delay 2
      tell app "Preview" to quit
      tell app "Finder" to close window 1

      delay 1
      do shell script "(cd arduino-serial && ./arduino-serial -b 9600 -p /dev/cu.usbmodem1411 -s x)"


    end tell

  else if (get name of every window of application "Finder") contains oldHWFolder then 

    tell app "System Events"
      delay 0.5

      say "My dad always stressed the importance of math and science. In his generation, the ones who were successful were either doctors or engineers." without waiting until completion
      display dialog "My dad always stressed the importance of math and science. In his generation, the ones who were successful were either doctors or engineers." buttons {"OK"}

      say "I once failed a biology test and cried. He said it was okay." without waiting until completion
      display dialog "I once failed a biology test and cried. \nHe said it was okay." buttons {"OK"}

      delay 0.5
      tell app "Finder" to close window 1

    end tell

  else if (get name of every window of application "Finder") contains closetFolder then
    
    tell app "System Events"
      delay 0.5
      say "I used to have a lot of toys. A LOT of them. My dad spoiled me rotten and pretty much gave me anything I asked for." without waiting until completion
      display dialog "I used to have a lot of toys. A LOT of them. My dad spoiled me rotten and pretty much gave me anything I asked for." buttons {"..."}

      say "Throwing toys into the closet always left me with a heavy feeling in my chest; after regularly breathing life into them during the many hours of playtime, it was hard for me to convince myself that my toys hadn’t always been alive in their own way." without waiting until completion
      display dialog "Throwing toys into the closet always left me with a heavy feeling in my chest; after regularly breathing life into them during the many hours of playtime, it was hard for me to convince myself that my toys hadn’t always been alive in their own way." buttons {"..."}

      say "So instead of confining them to the closet I took care to keep them in places where they could still see the sunlight, let them take turns sleeping next to me on the bed." without waiting until completion
      display dialog "So instead of confining them to the closet I took care to keep them in places where they could still see the sunlight, let them take turns sleeping next to me on the bed." buttons {"Do you still feel that way?"}

      say "I struggle a lot more with empathy now. Sometimes I wish I could remember how to feel sorry for inanimate objects." without waiting until completion
      display dialog "I struggle a lot more with empathy now.\n\nSometimes I wish I could remember how to feel sorry for inanimate objects." buttons {"OK"}

      -- turn on Poochi
      do shell script "(cd arduino-serial && ./arduino-serial -b 9600 -p /dev/cu.usbmodem1411 -s 3)"

      delay 2
      tell app "Finder" to close window 1
      do shell script "(cd arduino-serial && ./arduino-serial -b 9600 -p /dev/cu.usbmodem1411 -s x)"


    end tell

  end if

   if (get running of application "Preview") is true then 
       if (get name of every window of application "Preview") contains gregoryFile then

           tell app "System Events"
              delay 1
              say "That's me looking sassy as ever. I guess I've always been surrounded by computers." without waiting until completion
              display dialog "That's me looking sassy as ever. \nI guess I've always been surrounded by computers." buttons {"What's that on the computer screen?","Where was this?"}
              if result = {button returned:"What's that on the computer screen?"} then
                say "It's a game called 'Gregory and the Hot Air Balloon'. Have you heard of it?" without waiting until completion
                display dialog "It's a game called 'Gregory and the Hot Air Balloon'. Have you heard of it?" buttons {"Yes", "No"}

                if result = {button returned:"Yes"} then
                    say "Oh my gosh, I used to play it all the time. I still can't figure out whether he's supposed to be a bear or a hamster." without waiting until completion
                    display dialog "Oh my gosh, I used to play it all the time. I still can't figure out whether he's supposed to be a bear or a hamster." buttons {"OK"}

                else if result = {button returned:"No"} then
                    say "Really?" without waiting until completion
                    display dialog "Really?" buttons {"Yes", "No"} 
                    tell application "Safari"
                        delay 1
                        activate
                        open location "https://www.google.com/search?q=gregory+and+the+hot+air+balloon&biw=1384&bih=782&source=lnms&tbm=isch&sa=X&ved=0ahUKEwj-gYvC9cvLAhXD5iYKHZH4DDkQ_AUIBygC&dpr=2"
                        delay 1
                        activate
                    end tell
                    say "Ha ha, I used to play it all the time. Guess it wasn't that popular." without waiting until completion
                    display dialog "Ha ha, I used to play it all the time. Guess it wasn't that popular." buttons {"OK"}

                end if

              else if result = {button returned:"Where was this?"} then
                say "Oh, this was from when we were in Florida. We lived in a large house, next to a lake and a few families of ducks. I still remember the house vividly and sometimes stroll through it in my dreams." without waiting until completion
                display dialog "Oh, this was from when we were in Florida. We lived in a large house, next to a lake and a few families of ducks. I still remember the house vividly and sometimes stroll through it in my dreams." buttons {"Let's see it."}
                if result = {button returned:"Let's see it."} then
                  tell application "Safari"
                      delay 1
                      activate
                      open location "http://www.google.com/maps/@26.3884514,-80.1436115,3a,75y,34.5h,77.17t/data=!3m6!1e1!3m4!1smUVyRWeS3sRv5l1ELNxlag!2e0!7i13312!8i6656!6m1!1e1?hl=en"
                      delay 1
                      activate
                  end tell

                  delay 5 -- wait for the house to load
                  say "Man, it looks so different now." without waiting until completion
                  display dialog "Man, it looks so different now." buttons {"Must have been nice, living in Florida.", "What about the other houses?"}
                  if result = {button returned:"Must have been nice, living in Florida."} then
                    say "It was. Those were some of the best years of my life. If I had the choice, I would have stayed in that house for as long as I could." without waiting until completion
                    display dialog "It was. Those were some of the best years of my life. If I had the choice, I would have stayed in that house for as long as I could." buttons {"Why did you move?"}

                    say "..." without waiting until completion
                    display dialog "..." buttons {"..."} giving up after 2

                    say "My mom wanted us to." without waiting until completion
                    display dialog "My mom wanted us to." buttons {"OK"} giving up after 2

                  else if result = {button returned:"What about the other houses?"} then
                    say "The gray house right across from ours was Adam and Eric's. I can't believe their basketball net is still there." without waiting until completion
                    display dialog "The gray house right across from ours was Adam and Eric's. I can't believe their basketball net is still there."buttons {"..."}

                    say "The house to the left of theirs belonged to Alex. He kind of annoyed me sometimes but I enjoyed his company." without waiting until completion
                    display dialog "The house to the left of theirs belonged to Alex. He kind of annoyed me sometimes but I enjoyed his company."buttons {"..."}

                    say "And the house to the right with the brown garage door was Simon's. He came over often and we'd play games or watch Pokemon together. He was my first crush." without waiting until completion
                    display dialog "And the house to the right with the brown garage door was Simon's. He came over often and we'd play games or watch Pokemon together. He was my first crush." buttons {"..."}

                    say "Oh, and Eric lived in the house right next to ours on the left. Even though he was a few years older than me, he was really nice and didn't treat me like some pesky little kid. He was my second crush." without waiting until completion
                    display dialog "Oh, and Eric lived in the house right next to ours on the left. Even though he was a few years older than me, he was really nice and didn't treat me like some pesky little kid. He was my second crush." buttons{"Your neighborhood looks pretty swanky.", "...How many crushes did you have?"}
                    
                    if result = {button returned:"Your neighborhood looks pretty swanky."} then
                      say "Yeah, I didn't know about this back then but we apparently lived in one of the wealthiest communities in Southern Florida. It was the nicest neighborhood I've ever lived in." without waiting until completion
                      display dialog "Yeah, I didn't know about this back then but we apparently lived in one of the wealthiest communities in Southern Florida. It was the nicest neighborhood I've ever lived in." buttons {"OK"}
                    
                    else if result = {button returned:"...How many crushes did you have?"} then
                      say "Probably way too many for someone at that age." without waiting until completion
                      display dialog "Probably waaay too many for someone at that age." buttons {"OK"} 

                    end if

                  end if

                end if

              end if 

              tell app "Preview"
                delay 2
                quit
              end tell

           end tell

        else if (get name of every window of application "Preview") contains mompianoFile then

           tell app "System Events"
                delay 1
                say "This is the best part of the house. Had the piano and fireplace and everything." without waiting until completion
                display dialog "This is the best part of the house. Had the piano and fireplace and everything." buttons {"Nice bird.", "Who's that?"}

                if result = {button returned:"Nice bird."} then
                  say "Ha ha, that's Timmy. He was a good bird." without waiting until completion
                  display dialog "Ha ha, that's Timmy. He was a good bird." buttons {"What type of bird is that?", "OK"}

                  if result = {button returned:"What type of bird is that?"} then
                    say "He was a cockatoo. They're very friendly." without waiting until completion
                    display dialog "He was a cockatoo. They're very friendly." buttons {"OK"}
                  end if

                else if result = {button returned:"Who's that?"} then
                  say "That's me from all those years ago! Haven't changed much except for the hair." without waiting until completion
                  display dialog "That's me from all those years ago! Haven't changed much except for the hair." buttons {"I meant the person behind you.", "OK"}

                  if result = {button returned:"I meant the person behind you."} then
                    say "Oh." without waiting until completion
                    display dialog "Oh." buttons {"..."} giving up after 2

                    say "That's my mom." without waiting until completion
                    display dialog "That's my mom." buttons {"OK"} 
                  end if

                end if   

                tell app "Preview"
                  delay 2
                  quit
                end tell

           end tell 

        else if (get name of every window of application "Preview") contains momdrawing then

           tell app "System Events"
                delay 1
                tell app "Preview" 
                  quit
                end tell

                say "Hey, you weren't supposed to see that...I thought I put it away." without waiting until completion
                display dialog "Hey, you weren't supposed to see that...I thought I put it away." buttons {"OK"}

           end tell 


        else if (get name of every window of application "Preview") contains pianoFile then

           tell app "System Events"
                delay 1
                say "My middle name is Melody. For real. It's no coincidence that music is a huge part of my life." without waiting until completion
                display dialog "My middle name is Melody. For real. It's no coincidence that music is a huge part of my life." buttons {"OK"}

                -- play toy piano
                do shell script "(cd arduino-serial && ./arduino-serial -b 9600 -p /dev/cu.usbmodem1461 -s 0)"

                say "Fur Elise was one of the first real songs I learned how to play." without waiting until completion
                display dialog "Fur Elise was one of the first real songs I learned how to play." buttons {"How long have you been playing?"}
                
                say "I think it's been roughly 11 years now." without waiting until completion
                display dialog "I think it's been roughly 11 years now." buttons {"Did you take lessons and stuff?"} 
 
                say "For some reason my parents as intent on making me take lessons like many other kids at that age. They just let me do my own thing. Which has its benefits, of course. And drawbacks." without waiting until completion
                display dialog "For some reason they weren't as intent on making me take lessons like many other kids at that age. They just let me do my own thing. Which has its benefits, of course. And drawbacks." buttons {"Benefits?","Drawbacks?"} 

                if result = {button returned:"Benefits?"} then
                  say "I was too lazy and impatient to do basic things like read scores or learn music theory, so I learned many songs purely by ear and observation. I think it was because of that that I am able to remember many songs at a time." without waiting until completion
                  display dialog "I was too lazy and impatient to do basic things like read scores or learn music theory, so I learned many songs purely by ear and observation. I think it was because of that that I am able to remember many songs at a time." buttons {"..."} 

                else if result = {button returned:"Drawbacks?"} then
                  say "Development was pretty slow for me initially. I once had a friend over who was actually able to play with BOTH of her hands, while I was stuck trying to figure out 'Mary Had a Little Lamb' with one. It was frustrating." without waiting until completion
                  display dialog "Development was pretty slow for me initially. I once had a friend over who was actually able to play with BOTH of her hands, while I was stuck trying to figure out 'Mary Had a Little Lamb' with one. It was frustrating." buttons {"..."} 
                end if

                say "Hmmm." without waiting until completion
                display dialog "Hmmm." buttons {"..."} 
                
                say "I guess technically my mom tried to teach me a little. That didn't end too well." without waiting until completion
                display dialog "I guess technically my mom tried to teach me a little. That didn't end too well." buttons {"OK"} 

                tell app "Preview"
                  delay 2
                  quit
                end tell

           end tell 
        
        else if (get name of every window of application "Preview") contains beatlesFile then

         tell app "System Events"
            delay 1
            say "When I was in elementary school, whenever my dad drove me to school he would always put on The Beatles' Sargent Peppers album for us to listen to. I still vividly remember those times in the car." without waiting until completion
            display dialog "When I was in elementary school, whenever my dad drove me to school he would always put on The Beatles' Sgt. Peppers album for us to listen to. \nI still vividly remember those times in the car." buttons {"OK"}

            -- turn on record
            do shell script "(cd arduino-serial && ./arduino-serial -b 9600 -p /dev/cu.usbmodem1411 -s 1)"

            delay 2

            say "This music brings me way back." without waiting until completion
            display dialog "This music brings me way back." buttons {"You seem pretty close to your dad."}

            if result = {button returned:"You seem pretty close to your dad."} then
              say "Guess you could say that I am." without waiting until completion
              display dialog "Guess you could say that I am." buttons {"Are you close to your mom too?"}

              if result = {button returned:"Are you close to your mom too?"} then
                say "No." without waiting until completion
                display dialog "No." buttons {"OK"}

              end if 
            end if 

            tell app "Preview"
              delay 2
              quit
            end tell

            do shell script "(cd arduino-serial && ./arduino-serial -b 9600 -p /dev/cu.usbmodem1411 -s x)"
            
         end tell

       else if (get name of every window of application "Preview") contains sushiFile then

         tell app "System Events"
            delay 1
            say "Awww that's Su shi. She looks so young in that photo." without waiting until completion
            display dialog "Awww that's Sushi. She looks so young in that photo." buttons {"That's a cute name."}

            say "Well, I didn't name her." without waiting until completion
            display dialog "Well, I didn't name her." buttons {"Oh? Who did?"}

            display dialog "...My mom always named the pets." buttons {"..."}

            say "She used to tell me that whenever I named our pets, something bad would always happen to them. I believed that for a long time." without waiting until completion
            display dialog "She used to tell me that whenever I named our pets, something bad would always happen to them. \n\nI believed that for a long time." buttons {"Is Sushi still with you?"} 

            say "Yeah, actually. Out of all the pets we've had, she's been with us the longest. Still very sprightly, too." without waiting until completion
            display dialog "Yeah, actually. Out of all the pets we've had, she's been with us the longest. Still very sprightly, too." buttons {"..."}

            say "You know when Su shi was little she was this hairball of energy. She would just run around the halls of our house for no reason whatsoever. I heard from somewhere that animals were capable of seeing ghosts, so I believed that maybe she was running after them." without waiting until completion
            display dialog "You know when Sushi was little she was this hairball of energy. She would just run around the halls of our house for no reason whatsoever. I heard from somewhere that animals were capable of seeing ghosts, so I believed that maybe she was running after them." buttons {"..."}

            say "Even in her old age there are moments when she would suddenly jolt alert and sprint to the other side of the room, as if possessed by an enormous burst of energy." without waiting until completion
            display dialog "Even in her old age there are moments when she would suddenly jolt alert and sprint to the other side of the room, as if possessed by an enormous burst of energy." buttons {"..."}

            say "Whenever I see her do this now, I wonder why she still chases after those ghosts, and whether I sometimes do the same." without waiting until completion
            display dialog "Whenever I see her do this now I wonder why she still chases after those ghosts, and whether I sometimes do the same." buttons {"OK"}
           
            tell app "Preview"
              delay 2
              quit
            end tell
            
         end tell

         else if (get name of every window of application "Preview") contains momparkFile or (get name of every window of application "Preview") contains momdisneyFile then
           tell app "System Events"
              delay 1
              say "I usually avoid talking about my mom with other people. \n\nBut I suppose it's never too late to start." without waiting until completion
              display dialog "I usually avoid talking about my mom with other people. But I suppose it's never too late to start." buttons {"..."}

              say "See, the thing is, I haven't talked to my mom in a while. A long while. And I don't even think I'll ever be able to have a normal conversation with her again." without waiting until completion
              display dialog "See, the thing is, I haven't talked to my mom in a while. A long while. And I don't even think I'll ever be able to have a normal conversation with her again." buttons {"..."}

              say "I'm sure I have some friends who think that she's dead or something—and she's not. At least, not in the physical sense." without waiting until completion
              display dialog "I'm sure I have some friends who think that she's dead or something—and she's not. At least, not in the physical sense." buttons {"..."}

              say "We used to be pretty close when I was young. She would do things like take me to parks and make me my favorite mac n cheese and kiss me goodbye and sing me to sleep the same way all good moms would." without waiting until completion
              display dialog "We used to be pretty close when I was young. She would do things like take me to parks and make me my favorite mac n' cheese and kiss me goodbye and sing me to sleep the same way all good moms would." buttons {"..."}

              say "But at the same time she said and did some really hurtful things that I can't block out of my mind. Things that made a large dent in my self-esteem. And maybe I'm just a crappy person, but I can't forgive because I can't forget and I can't just let it go." without waiting until completion
              display dialog "But at the same time she said and did some really hurtful things that I can't block out of my mind. Things that made a large dent in my self-esteem. And maybe I'm just a crappy person, but I can't forgive because I can't forget and I can't just let it go." buttons {"..."}

              delay 1

              say "That being said. . .sometimes I wish I could talk to her. Like really talk to her. About things moms and daughters talk about. But even she has changed a lot over the years." without waiting until completion
              display dialog "That being said. . .sometimes I wish I could talk to her. Like really talk to her. About things moms and daughters talk about. But even she has changed a lot over the years." buttons {"..."}

              say "And so have I." without waiting until completion
              display dialog "And so have I." buttons {"..."}

              say "Maybe one day, when circumstances are better for the both of us, I'll finally have the resolve to close the distance between us. But for now it's enough for us to keep those good memories stowed away in the attics of our minds." without waiting until completion
              display dialog "Maybe one day, when circumstances are better for the both of us, I'll finally have the resolve to close the distance between us. \n\nBut for now it's enough for us to keep those good memories stowed away in the attics of our minds." buttons {"..."}

              delay 2

              say "Thank you for listening to my prattle. It means so much to me." without waiting until completion
              display dialog "Thank you for listening to my prattle. It means so much to me." buttons {"OK"}

              tell app "Preview"
                delay 3
                quit
              end tell

              set atticvisits to 0

              repeat 7 times
                delay 0.5
                keystroke "w" using {command down} 
              end repeat 

              -- turn on clock
              do shell script "(cd arduino-serial && ./arduino-serial -b 9600 -p /dev/cu.usbmodem1411 -s 5)"

              display dialog "She wakes." with title "THE END" buttons {"OK"}

              say "Special thanks to Golan Levin and the STUDIO for Creative Inquiry for funding this project. I would also like to thank ModelTalker for making such an amazing synthesized form of my voice (for free). And of course, thank you to my friends, professors, and family for supporting me throughout the years. Without them, I would not have as many incredible stories to share." without waiting until completion
              display dialog "Special thanks to Golan Levin and the STUDIO for Creative Inquiry for funding this project. I would also like to thank ModelTalker for making such an amazing synthesized form of my voice (for free!). And of course, thank you to my friends, professors, and family for supporting me throughout the years. Without them, I would not have as many incredible stories to share." with title "THE END" buttons {"Restart program"}

           end tell
 
      end if 

   end if

   delay 1

end repeat

