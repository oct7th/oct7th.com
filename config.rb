###
# Compass
###

# Change Compass configuration
# compass_config do |config|
#   config.output_style = :compact
# end

###
# Page options, layouts, aliases and proxies
###

# No layout as this is a single page site
set :layout, false

# Per-page layout changes:
#
# With no layout
# page "/path/to/file.html", :layout => false
#
# With alternative layout
# page "/path/to/file.html", :layout => :otherlayout
#
# A path which all have the same layout
# with_layout :admin do
#   page "/admin/*"
# end

# Proxy pages (https://middlemanapp.com/advanced/dynamic_pages/)
# proxy "/this-page-has-no-template.html", "/template-file.html", :locals => {
#  :which_fake_page => "Rendering a fake page with a local variable" }

###
# Helpers
###

# Automatic image dimensions on image_tag helper
# activate :automatic_image_sizes

# Reload the browser automatically whenever files change
# configure :development do
#   activate :livereload
# end

config[:base_url] = (ENV['MM_ENV'] == 'production') ? 
  'http://oct7lastday.com' : 'http://staging.oct7lastday.com'

# Methods defined in the helpers block are available in templates
helpers do
  # Array of all languages except the current one
  def other_langs
    langs - [I18n.locale]
  end
  # Display a language for menu as "Language name (locale)"
  def lang_display(lang)
    "#{config[:langs_meta][lang][:name]} (#{lang.to_s})"
  end
  # Return the value of the dir attribute for LTR/RTL support
  def lang_dir
    config[:langs_meta][I18n.locale][:dir]
  end
  # Youtube video id for current locale else for English
  def youtube_id
    config[:langs_meta][I18n.locale][:youtube_id] ||
      config[:langs_meta][:en][:youtube_id]
  end
  # Return "(English)" in the current language unless it's English
  def english_note
    I18n.locale == :en ? '' : '(' + t('english') + ')'
  end
end

set :css_dir, 'stylesheets'

set :js_dir, 'javascripts'

set :images_dir, 'images'

set :fonts_dir, 'fonts'

# Build-specific configuration
configure :build do
  # For example, change the Compass output style for deployment
  # activate :minify_css

  # Minify Javascript on build
  # activate :minify_javascript

  # Enable cache buster
  # activate :asset_hash

  # Use relative URLs
  # activate :relative_assets

  # Or use a different image path
  # set :http_prefix, "/Content/images/"
end

# Localization (English is a subdir like other languages)
activate :i18n, :mount_at_root => false, 
  :langs => [ :en, :es, :fr, :id, :'pa-PK', :pl, :ru, :ur, :vi ]

# Languages metadata
config[:langs_meta] = {
  :ar => { :dir => 'rtl', :name => "&#x0627;&#x0644;&#x0639;&#x0631;&#x0628;&#x064A;&#x0629;", :name_en => 'Arabic',
           :youtube_id => 'GvBq3MJAhUA' },
  :de => { :dir => 'ltr', :name => "Deutsch", :name_en => 'German',
           :youtube_id => nil },
  :en => { :dir => 'ltr', :name => "English", :name_en => 'English',
           :youtube_id => 'O3ExzOX31yY' },
  :es => { :dir => 'ltr', :name => "Español", :name_en => 'Spanish',
           :youtube_id => '8w7LNlYkrHA' },
  :fr => { :dir => 'ltr', :name => "Fran&ccedil;ais", :name_en => 'French',
           :youtube_id => 'mUL9hsmzErs' },
  :hi => { :dir => 'ltr', :name => "&#x0939;&#x093F;&#x0928;&#x094D;&#x200D;&#x0926;&#x0940;", :name_en => 'Hindi',
           :youtube_id => 'y39RVfyFKtg' },
  :id => { :dir => 'ltr', :name => "Bahasa Indonesia", :name_en => 'Indonesian',
           :youtube_id => 'CTWRMo6KUCk' },
  :ja => { :dir => 'ltr', :name => "&#x65E5;&#x672C;&#x8A9E;", :name_en => 'Japanese',
           :youtube_id => 'jGrVL6nB-_E' },
  :'pa-PK' => { :dir => 'rtl', :name => "پنجابی", :name_en => 'Punjabi, Pakistan',
           :youtube_id => 'EmEf54BcanQ' },
  :pl => { :dir => 'ltr', :name => "Polski", :name_en => 'Polish',
           :youtube_id => 'YJ7eEvWXuuM' },
  :ru => { :dir => 'ltr', :name => "&#x0420;&#x0443;&#x0441;&#x0441;&#x043A;&#x0438;&#x0439;&nbsp;(Russkij)", :name_en => 'Russian',
           :youtube_id => 'v1kF2IM-GC4' },
  :tl => { :dir => 'ltr', :name => "Tagalog", :name_en => 'Tagalog',
           :youtube_id => nil },
  :tr => { :dir => 'ltr', :name => "T&uuml;rk&ccedil;e", :name_en => 'Turkish',
           :youtube_id => 'UgsJLjmdCJE' },
  :ur => { :dir => 'rtl', :name => "اُردُو", :name_en => 'Urdu',
           :youtube_id => 'uSEfbDiILuk' },
  :vi => { :dir => 'ltr', :name => "Ti&#7871;ng Vi&#7879;t", :name_en => 'Vietnamese',
           :youtube_id => 'SrOjE_zyj48' },
  :zh => { :dir => 'ltr', :name => "&#x4E2D;&#x6587;", :name_en => 'Chinese',
           :youtube_id => 'iUPQZ_pzzFc' },
}

# Support Apache .htaccess
page 'htaccess.txt', :layout => false
# Rename file after build
after_build do
  File.rename 'build/htaccess.txt', 'build/.htaccess'
end

