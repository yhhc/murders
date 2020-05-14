a <- seq(1,10,2)
b <- c(1:10)

# Video 19: Working directory

## pwd: print working directory in Unix
## The String returned by pwd is the full path of the working directory
## "Relative paths" tell us how to get to a directory from the working directory
## In Unix, we use the sharthand ~ as a nickname for the home directory

# Video 20: The Unix commands

## ls: list directory content
## mkdir; rmdir
## example: mkdir doc teaching
## example: rmdir doc teaching
## If the directory is not empty, rmdir that directory will get an error message and the directory will remain
## untouched
## rm: remove directories that are not empty
## cd: change directory
## To check the working directory is changed, we can use the command pwd
## In Unix, one can auto complete by hitting Tab
## If the path you type does not start with a forward slash or a tilde, Unix will assume you're typing a relative
## path, meaning that it will look for the directory in your current working directory
## cd .. : move back to the parent directory
## cd ~  : always take us back to the home directory no matter where we are in the file system
## .     : nickname for the current working directory. Example: cd . will stay in the same directory
## If we want a command that takes us to the projects directory no matter where we are in the file system, we can
## type "cd ~/projects", which is equivalent to writing the entire path out.
## I tried this on Mac and it works, but not on Git bash
## cd ../..
## cd -  : return to whatever directory you just left
## cd    : return to home directory
## Example: relative path: cd ../../project-2
##          full path    : cd ~/projects/project-2

# Video 21: mv and rm: Moving and Removing Files
## mv     : move files from one directory to another
##          will not ask you are you sure
##          if you move a file to a directory where another file with the same name exists, you lose that file
##          format: mv path_to_file path_to_destination_directory 
##          example: under /Documents/, type: mv IUIO_20190507.pptx ~/Documents/R/
##          example: under /Documents/R, type mv IUIO_20190507.pptx .. or mv IUIO_20190507.pptx ../
##          example: under /Documents/R, type mv ../IUIO_20190507.pptx ./
##          example: under /Documents/, type: mv IUIO_20190507.pptx IUIO.pptx (also rename the file name when moving it)
##          example: under /Documents/, type mv IUIO.pptx ./R/IUIO_20190507.pptx ..
##          We can also move enture directories:
##          example: under /Documents/, type mv ./Zoom ./R/
##          It is important to add / after R to make it clear that we do not want to rename Zoom to R, but rather
##          move Zoom into the R directory
##          example: under /Documents/R/, type mv Zoom ../
## cp     : copy command behaves similar to mv command, except that instead of moving we copy the file
##          In all the mv examples we just saw, we can switch mv to cp, and they will copy instead of move, with
##          one exception: We can't copy entire directories without learning about arguments
## rm     : remove files. Warning: rm is permanent so be careful!!
##          example: rm filename-1 filename-2 filename-3
##          to remove directories we need to learn arguments, which we will do later.

# Video 22: less: Looking at a file
## Using "less" to look at the content of a text file
## example: under ~/Documents/R/r/ type "less README.md", this will ipen up the less viewer
## to exit the viewer type q; to move up and down the file use the arrows
## many other keyboard commands for less to search or to jump pages

# Video 23: Preparing for a Data Science Project
## cd ~
## mkdir projects
## cd projects
## mkdir murders
## cd murders
## mkdir data rda
## ls
## pwd
## The full path of our murders data set is ~/projects/murders
## File -> New Project -> Existing Directory -> Choose C:/Users/Henry/projects/murders
## Decault working directory: ~/projects/murders
## Check the Terminal and we can verify this, or typing getwd() into your R session
## In the R code, always use relative paths when you're working on a data science project and relative path
## to a default working directory for the code reusability when being run on other machines.
## You don't want to use ~ in your code since the home directory may be different.
## File -> New File -> R Script -> save as "download-data.R"
## Note that dest_file <- "data/murders.csv uses the relative path
## Write a script to read this data stored in /data and prepare a table that we can use for further analysis.
## control shift N      : open new file
## control S            : save file
## control shift enter  : execute all lines of code at once

## mkdir figs
## Create a README.txt file describing what each of these files does for the benefit of others reading your 
## code, including your future self.

# Video 24: Reproducible Reports with R Markdown
## We describe how to generate reproducible reports with RMarkdown and knitr.
## The main feature is that code and textual descriptions can be combined into the same document, and figures
## and tables produced by the code are automatically added to the document.

# Video 25: R Markdown
## R Markdown is a format for what is called literate programming documents. It is based on Markdown, a markup
## language that is widely used to generate HTML pages.
## Markdown: www.markdowntutorial.com
## Literate programming weaves instructions, documentation, and detailed comments in between machine-executable
## code, producing a document that describes the program that is best for human understanding.
## KnitR compiles R markdown documents.
## The r Markdown document looks different than the final product. 
## Seems like a disadvantage but it is not because for example, rather than producing plots and inserting them one
## by one into the word processing document, the plots are automatically added.
## In R, you can start a R Markdown document by clicking on File -> New File -> R Markdown
## Select HTML as the preferred format for debugging purposes
## As a convention we use the .Rmd suffix for these files
## The thing between --- is the header
## One parameter in the header we will highlight is output. By changing this to, for example, PDF_document, we 
## can control the output that is produced when we compile so that it makes a PDF instead of an HTML document.
## 
## ```{r setup, include=FALSE}
## knitr::opts_chunk$set(echo = TRUE)
## ```
## The above are the R chunks, where we write the R code.
## To add your own R chunks, you're going to have to type those characters you saw.
## Use keybinding to do this: on the Mac it's Command-Option-I, and on Windows, is Control-Alt-I
## This will automatically create an empty code chunk.
## When you compile the document, the R code inside these chunks - in the case of the example we're seeing here,
## it's summary pressure - will be evaluated, and the result included in that position in the final document,
## This applies to plots as well. The plot will be placed in the position where the R chunk is.
##
## '''{r}
## summary(pressure)
## '''
##
## '''{r, echo = FALSE}
## plot(pressure)
## '''
## By adding "echo = FALSE" you can avoid showing the code. In the example above, we make the plot without
## showing the code.
## We recommend getting into the habit of adding a label to the R code chunks. This will be very helpful when 
## debugging, among other advantages. You can do this by writing a descriptive word like this:
##
## '''{r pressure-summry}
## summary(pressure)
## '''

# Video 26: Knitr
## To convert a R markdown file into a document, we need to use the knitr package
## The specific function used to compile is the knit function.
## Click the "Knit" button when working on a R Markdown file
## https://raw.githubusercontent.com/rairizarry/murders/master/report.Rmd
## Free resources about R markdown:
## rmarkdown.rstudio.com
## yihui.name/knitr/

# Video 27: Git and GitHub
## Free resources:
## Codecademy
## GitHub Guides
## Try Git tutorial
## Happy Git and GitHub for the useR
## To effectively permit version control and collaboration, in Git, files move across four
## different areas: Working directory -> Staging area -> Local repository -> Upstream Repository

# Video 28: Using Git at the command line
## We will clone an existing upstream repository. We can see it on GitHub by following this
## link: github.com/rairizarry/murders
## What does clone mean: copy the entire git structure, which means we will add the files and
## directories to each of the three local stages: working directory, staging area, and local repository
## Open the terminal and type the following:
## mkdir git-example
## cd git-example/
## type git clone and add the URL to the upstream repository:
## git clone https://github.com/rairizarry/murders.git
## Now the working directory is the same as the Unix working directory. However, when you edit
## files using an editor such as RStudio, you change the files in your working directory and
## only in here. Git can tell you how these files relate to the version of the files in other
## areas with the command git status.
## Edits in the staging area are not kept by the version control system.
## We add a file to the staging area with the git add command.
## echo "test" >> new-file.txt
## echo "temporary" >> tmp.txt
## Now we will stage file in our repository
## git add new-file.txt
## new-file.txt will be tracked although it's not commited yet, but tmp.txt will not be tracked
## at all.
## Now, any changes we make to newfile.txt will get added to the repository next time we commit.
## Whenever you commit, you have to add a message stating what you're doing. In this case, we're
## going to use the message "adding a new file"
## git commit -m "adding a new file"
## echo "adding a line" >> new-file.txt
## nOW stage it: git add new-file.txt
## now commit it: git commit -m "adding a new line to new-file"
## We can skip the staging part if we add the file name to the commit command like this:
## git commit -m "minor changes to new-file" new-file.txt
## git log: Keep track of all changes we made
## git push: push to the upstream repo
## git fetch: update our local repo to be the one like the upstream repo
## To make thrse copies to the staging and working directory, we use "git merge"
## git pull ie equal to git fetch followed by git merge

# Video 29: Creating a GitHub Repository
## Create a local repo
## cd ~/projects/murders/
## Git knows nothing about this working directory. We need to make it a local Git directory.
## To do this, we need to initialize it by typing "git init" in the command line, assuming we're 
## in the right directory. This turns the directory into a Git directory and Git starts tracking
## everything. Note that all the files are just in the working directory as we haven't staged them,
## and we haven't committed them.
## Two steps to do now: 1) Start moving files into our local repo; 2) Connect the local repo
## with our Github repo.
## In the previous example we had RStudio do this by starting the whole project as a Git project.
## But now we will do it ourselves. We will just add one of the files just to get started.
## git add README.txt
## git commit -m "First commit, Adding README.txt file just to get started"
## We now have a file in our local repo, just the file README.txt
## We are ready to connect our local repo, which now has one file, to our upstream repo.
## Command to use for connecting local repo with upstream repo: git remote
## git remote add origin https://github.com/yhhc/murders.git (Assuming the upstream repo "murders"
## has been created)
## Now they are connected!
## We will push the file we have up to our GitHub repository. So we type git push and this would
## do it.































