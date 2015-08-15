# Oct 7th website

This is the source for the oct7th.com website.

Design and graphics &copy; Oct7th.com 2015.

## Technical Overview

The [Middleman](http://middlemanapp.com) static site generator is used to
build the site. Although the site is only one page, it is translated into
many languages. Each translation is located in the locales/ folder as a
YAML file. When the `middleman build` command is run, these translations
are merged with the single template in source/localizable/index.html.erb
generating a page for each language.

Translations are managed with the [WebtranslateIt](http://webtranslateit.com)
site. As updates are made to a translation, the respective translation is downloaded to the locales/ folder using the `wti pull` command.

