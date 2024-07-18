# Getting Started Guide

This guide will help new contributors set up their environment, clone the repository, create a new branch, and make their first commit to update the MII Standorte CodeSystem.

## Prerequisites

1. **Git**: Version control system
2. **FSH/SUSHI** (Optional): Tools for FHIR shorthand, if needed for this project
3. **Visual Studio Code (VS Code)**: Integrated Development Environment (IDE)

## Step-by-Step Guide

### 1. Install Git

Git is essential for version control and managing your repository.

**For Windows:**
- Download Git from the official website: [Git for Windows](https://git-scm.com/download/win)
- Run the installer and follow the setup instructions.

**For macOS:**
- Open Terminal and type: 

  ```bash
  git --version
  ```

  If Git is not installed, you will be prompted to install it.

- Alternatively, you can install Git using Homebrew:

  ```bash
  brew install git
  ```

**For Linux:**

- Use the package manager of your distribution (e.g., apt for Debian/Ubuntu): 

  ```bash
  sudo apt-get update
  sudo apt-get install git
  ```

### 2. (Optional) Install FSH/SUSHI

FHIR shorthand (FSH) and SUSHI are recommended but not required.

- Follow the installation instructions from here: https://fshschool.org/docs/sushi/installation/ 

### 3. Install Visual Studio Code (VS Code)

Other IDEs work as well, but VS Code offers a usefull language support extension for the FHIR Shorthand (FSH) language.

- Download and install VS Code from the official website: https://code.visualstudio.com/

### 4. Clone the Repository

Now, clone the kerndatensatz-meta repository. 

1. Open a terminal (Git Bash or Command Prompt on Windows, Terminal on macOS/Linux).

2. Clone the repository using the following command:

  ```bash
  git clone https://github.com/medizininformatik-initiative/kerndatensatz-meta.git
  ```

### 5. Make Changes to the Repository

1. Open VS Code, navigate to the cloned repository and open it.

![kerndatensatz-meta repository in VS Code](images/Screenshot-01.png)

2. Create a new git-branch for working on new features or changes.

Working with git can be done by using the a) VS Code GUI or b) a terminal.

a) VS Code GUI:
- Select the Source Control icon in the Activity Bar
- Select `...` -> `Branch` -> `Create Branch...`

![Source Control in VS Code](images/Screenshot-02.png)

- Enter a branch name
- The example uses the branch name `feat/update-standorte`

![Branch Naming in VS Code](images/Screenshot-03.png)

b) Terminal:
- Open a new terminal

![Terminal in VS Code](images/Screenshot-04.png)

- Create and switch to a new branch named `feat/update-standorte`

  ```bash
  git checkout -b `feat/update-standorte`
  ```

![Create and switch to a new branch](images/Screenshot-05.png)

3. Navigate to the FSH Files and make Changes

- Select the Explorer icon in VS Code
- Navigate to the `input/fsh` folder
- The DIZ-Standorte CodeSystem is located in `input/fsh/codesystems`
- Select the file `mii-cs-meta-diz-standorte.fsh`
- Optional: select the Extensions icon in VS Code and install the FHIR Shorthand extension for syntax highlighting 

![DIZ-Standorte FSH-file](images/Screenshot-06.png)

- Each new line must start with a `*`
- `*` is followed by `#` and then the MII Standort-Kürzel, "Bezeichnung" and "Standort" in double quotes, e.g.
- `*` `#<Standort-Kürzel>` `"<Bezeichnung>"` `"<Standort>"`
- There are convenience functions to add the Konsortium, Identifier DSF, Status, DeprecationDate, RetirementDate. Add a new line for each. These are optional. If information is not available, just leave them out. Make sure to always start with the right Standort-Kürzel. The syntax is as follows:
- - `*` `#<Standort-Kürzel>` `insert AddKonsortium(<Konsortium>)`
- - `*` `#<Standort-Kürzel>` `insert AddUri(<Identifier DSF>)`
- - `*` `#<Standort-Kürzel>` `insert AddStatus(<active|deprecated|retired>)`
- - `*` `#<Standort-Kürzel>` `insert AddDeprecationDate(<YYYY-MM-DD>)`
- - `*` `#<Standort-Kürzel>` `insert AddRetirementDate(<YYYY-MM-DD>)`

![Add information to FSH-file](images/Screenshot-07.png)

- Important: For legacy and consistency reasons - Donot delete lines if a Standort-Kürzel changes or is removed from MII. Rather set the status first to `deprecated` and later to `retired` and add the deprecation or retirement date.

![Example Standort in FSH-file](images/Screenshot-08.png)

- After changes have been made (make sure to save), check the `^date` parameter. This is to indicate the date that the file was last changed. The date format is `"YYYY-MM-DD"`.

- Optional: if previously installed, SUSHI can be run locally by using the terminal command:

  ```bash
  sushi build . 
  ```

- The updated CodeSystem resource `CodeSystem-mii-cs-meta-diz-standorte.json` will be available in the repository under `fsh-generated/resources`. 

### 6. Commit and Push your Changes

After making your changes, commit them to your branch. Again either use `a)` VS Code GUI or `b)` a terminal.

`a)` VS Code GUI:

- Select the Source Control icon
- Under `Changes` select `+` next to the `mii-cs-meta-diz-standorte.fsh` file to `Stage Changes`
- Enter a commit message in the `Message` box and select the `Commit` button
- Select `...` -> `Push`

![Commit changes in VS Code](images/Screenshot-09.png)

`b)` Terminal

- Stage your changes:

  ```bash
  git add .
  ```

- Commit your changes with a message:

  ```bash
  git commit -m "Updated standorte codesystem"
  ```

- Push your changes to the remote repository:

  ```bash
  git push origin feat/update-standorte
  ```

![Commit changes in Terminal](images/Screenshot-10.png)

### 7. Create a Pull Request

The repository uses a pull request (PR) workflow, you can create a PR to merge your changes into the main branch.

1. Go to the GitHub repository in your browser: https://github.com/medizininformatik-initiative/kerndatensatz-meta 

2. Click on the Compare & pull request button next to your recently pushed branch.

![Compare & pull request on GitHub](images/Screenshot-11.png)

3. Fill in a short description of your changes and submit the PR.

![Pull request creation on GitHub](images/Screenshot-12.png)

4. There is an automated quality control feature that will check the content of the PR and generate the FHIR resources (if not previously generated by SUSHI locally and commited to source control). A green check mark will appear once the check is successfull. Under `Reviewers` assign someone from the Core Dataset team to review your PR.

![Pull request review on GitHub](images/Screenshot-13.png)

### 8. Check the Results

Once the reviewer has merged your PR into the main branch, the resource will be updated on the Simplifier platform and updates will be visible via this link: https://simplifier.net/medizininformatikinitiative-kerndatensatz/mii-cs-meta-diz-standorte 