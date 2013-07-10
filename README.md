WDI_Homework 
=================

#### How To Use Git For Your Homework
[![How to fork this
repo](https://github-images.s3.amazonaws.com/help/Bootcamp-Fork.png)](../../fork)

Fork today's homework repo, which is an extension of your lab [imdb-private](https://github.com/clearf/rails-todo-with-contacts)
Change directories to the lab repository that you worked on in class.

Run 

``git remote add homework <URL>``

where <URL> is the ssh URL from your forked repository (what you usually use to clone from, 
something in the form of "git@github.com:USERNMAE/REPO_NAME.git")

If the homework destination is already defined, to SET thisthe destination as a new URL, do:

``git remote set-url homework <URL>`` 

``git pull homework master``
You may be asked to commit a merge. Save and close the merge message. 

``git push homework master``

Now when you push, you'll do 
``git push homework master``

When you're done, issue a pull request from the private-imdb forked repository. 


