# Contributing to Gurgstation

Hi hi, thanks for checking this out, this document is just a giant archive explaining how to contribute to the code. It's mostly yoinked from vorestation but with a small twist.

These are just guidelines, not rules, use your best judgment and feel free to propose changes to this document in a pull request.

##### Please for the love of god if you have any issues developing anything, contact a developer and they will try their best to help.

#### Table Of Contents

[What should I know before I get started?](#what-should-i-know-before-i-get-started)
  * [Code of Conduct](#code-of-conduct)

[How Can I Contribute?](#how-can-i-contribute)
  * [Your First Code Contribution](#your-first-code-contribution)
  * [Gurgstation Coding Standards](#gurgstation-coding-standards)
  * [Pull Requests](#pull-requests)
  * [Git Commit Messages](#git-commit-messages)
  * [Useful Guides](#useful-guides)

[Licensing](#Licensing)


## What should I know before I get started?

### Code of Conduct

This project adheres to the Contributor Covenant [code of conduct](CODE_OF_CONDUCT.md).
By participating, you are expected to uphold this code.

## How Can I Contribute?

### Your First Code Contribution

Unsure where to begin contributing to Gurgstation? You can start by looking through the issues tab.

### Gurgstation Coding Standards

If your submission doesn't meet the standards we'll probably reject it, but we will definitely provide feedback on why it would be rejected. We won't reject or close your submission unless you refuse to make any changes to our review. Below is some of those standards.

* If you know the change has been made on vorestation's or polaris' end then try to hold back modifying the file, this is to prevent any conflicts coming and having to manually fix the stuff again. If you would like to prevent this, submit the change on their repository instead.
* Change whitespace as little as possible. Do not randomly add/remove whitespace.
* Map changes must be in tgm format. See the [Mapmerge2 Readme] for details. (Or just use strongdmm and it will handle all this automatically)

### Pull Requests

* Your submission must pass CI checking. The checks are important, prevent many common mistakes, and even experienced coders get caught by it sometimes. If you think there is a bug in CI, open an issue. (One known CI issue is comments in the middle of multi-line lists, just don't do it)
* Your PR should not have an excessive number of commits unless it is a large project or includes many separate remote commits (such as a pull from Polaris). If you need to keep tweaking your PR to pass CI or to satisfy a maintainer's requests and are making many commits, you should squash them in the end and update your PR accordingly so these commits don't clog up the history.
* You can create a WIP PR, and if so, please mark it with [WIP] in the title **and make it a draft pr** so it can be labeled appropriately. These can't sit forever, though.
* If your pull request has many no-conflict merge commits ('merge from master' into your PR branch), it cannot be merged. Squash and make a new PR/forcepush to your PR branch.

### Git Commit Messages

* Limit the first line to 72 characters or less, otherwise it truncates the title with '...', wrapping the rest into the description.
* Reference issues and pull requests liberally.
* Use the GitHub magic words "Fixed/Fixes/Fix, Resolved/Resolves/Resolve, Closed/Closes/Close", as in, "Closes #1928", as this will automatically close that issue when the PR is merged if it is a fix for that issue.

### Useful Guides

#### PLEASE FIRST BEFORE ANYTHING DO THIS ONE FIRST SO YOU CAN ACTUALLY SEND THE WORK WITHOUT A MIDDLEMAN
https://forums.yogstation.net/threads/release-the-gitkraken-how-to-make-your-first-pull-request.15099/
Replace their GitHub URL with the one we use by the way. We don't use yogstation code c:


#### CODING

Setting up VSCode:
 https://www.paradisestation.org/wiki/index.php/Guide_to_Contributing#Setting_up_Visual_Studio_Code 

Bibles:
 http://www.byond.com/docs/ref/
 http://www.byond.com/docs/guide/ non SS13 guide to help get into BYOND language.
 https://tgstation13.org/wiki/Understanding_SS13_code guide to help code with SS13
 https://tgstation13.org/wiki/SS13_for_experienced_programmers great reference for newcomers

#### SPRITING

You can right click the icon and export it as a png. And import too to make sprites.

#### MAPPING
 https://wiki.ss13polaris.com/index.php?title=Guide_to_StrongDMM

 https://tgstation13.org/wiki/Guide_to_mapping read this first to understand how SS13 works if you don't already 

I suggest using external software such as FastDMM 2 or Strongdmm found here:
 https://github.com/SpaiR/StrongDMM
 https://fastdmm2.ss13.io/


## Licensing
Gurgstation is licensed under the GNU Affero General Public License version 3, which can be found in full in LICENSE-AGPL3.txt.

Commits with a git authorship date prior to `1420675200 +0000` (2015/01/08 00:00) are licensed under the GNU General Public License version 3, which can be found in full in LICENSE-GPL3.txt.

All commits whose authorship dates are not prior to `1420675200 +0000` are assumed to be licensed under AGPL v3, if you wish to license under GPL v3 please make this clear in the commit message and any added files.

[Mapmerge2 Readme]: ../tools/mapmerge2/readme.md
