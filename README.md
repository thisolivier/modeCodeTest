# Bitcoin Refactor Test

## OG Instructions
This project contains an isolated problem that we need to solve. It doesn't have any network communication, 
and it only shows the state of the data sources.

This code is written without following best practices; it doesn't have any tests, there are no SwiftUI
previews, and most developers who have to fix bugs around it tend to spend more time than it should take.

Your job is to refactor it to make the code clean and maintainable, whatever your understanding of
these terms is. You have all the freedom to restructure the entire code and delete as much you feel necessary.

You need to apply pragmatic judgment and use practices you would expect to have in the production code.

If you run out of time, please briefly describe what else you would do.

## Discovery Period
App is designed to show the current market price of Bitcoin (and its change in price in GBP and as a %).
I can also see the current value of my total BTC investment, a list of my contributions, the interest and all time return. 
I'm not sure how interest and return would differ, nor why itemised investments would track individual all time returns independenly from the total pot value. I will need to answer these.

I'm curious what this iscolated problem is. "contains an isolated problem that we need to solve"

Goals: 
- Fix the use of Enums (do not duplicate the information directly into the views)
- Break up AssetSubAmountView
- Make view models for each view
- Split the view hierachy so portfolio vs assets are on their own branches of the view hierachy

## Reflections

My goal was to restructure the app so we weren't maintaining multiple unrelated views within the same parent depending on dynamic data.
This would involve creating atomic views with their own view models, keeping better inferface segregation.
Unfortunately I have not been able to design child view models which maintain the dynamic properties of the original. In retrospect, loosing the reactive component and rebuilding it after sorting the view structure & POS view models could have been a better approach.
