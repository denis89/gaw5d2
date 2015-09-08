## The homework tonight is to AJAXIFY your video tube homework from last week-end.

This will be very similar to the todo lab so don't hesitate to go back and forth between the two.

When the page has loaded for the first time, display all the videos currently in the database.

After this moment, whatever happens there will be no page refresh at all. 

* Create event listeners to trigger the Ajax requests. (there is no need for forms to have a 'method: get/post' anymore.)
* When adding a video, add it first to the database, then append it to the page 
* When editing a video, update it first in the database, then update the page with the new values (no refresh!)
* When deleting a video, delete it first from the database, then remove it from the page


#### Notes

* If your memetube is not working, just get the solution from the repo
* Use RESTful routes! If you don't remember what that means, have a look at the notes in the repo
* Do things little by little, one small function after the other. Do not leave an error unresolved.
* Use `binding.pry` and `console.log` until you bleed
* Remember to seed your database with the stuff you want, e.g. `psql -d this_db -f this_file.sql`

#### Bonus

* Styling, make it fun
* Display vides by categories (only using Ajax)
* Get a random video from Youtube (one that's not already in your database)