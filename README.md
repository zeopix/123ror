Please read the instructions carefully and ensure you understand the
requirements before you start coding.
There is no time limit as such on the task, you can work on it over
the next couple of days as you see fit and as your time allows and
keep focused on the quality of your code and the chosen solutions.
It's important that you use a (local) git repository to track your
code as you go along.
Enjoy your coding and good luck!
### TASK description ###
Create a Single Page application (using Ruby on Rails, Sinatra, or any
other framework of your choice) that calls the following URL and
navigates through it's content.
URL: http://www.betvictor.com/live/en/live/list.json
The Content hierarchy is: Sports → Events → Outcomes
Minimum requisites are:
* Method to list all sports (/sports)
* Method to list all events for a given sport (/sports/<id>)
* Method to list all outcomes for a given event (/sports/<id>/events/
<id>
* Full test coverage (Rspec is a good test framework)
Notes:
* Obey list order as per API 'pos' property
* Commit as you go along (use a local, private Git repository)
Extra points for:
* Language support
* Jasmine tests
