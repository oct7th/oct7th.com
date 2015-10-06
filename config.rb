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
  # Force closed captions for this locale?
  def youtube_cc?
    config[:langs_meta][I18n.locale][:youtube_cc]
  end
  # Youtube closed caption attributes for html iframe
  def youtube_cc_html
    youtube_cc? ? "&amp;cc_load_policy=1&amp;hl=#{I18n.locale}" : ''
  end
  # Return "(English)" in the current language unless it's English
  def english_note
    I18n.locale == :en ? '' : '(' + t('english') + ')'
  end
  # Facebook pixel id
  def facebook_pixel(type)
    config[:facebook_pixel][I18n.locale][type]
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
  :langs => [ :ar, :de, :en, :es, :fr, :hi, :id, :it, :ja, :ko, :ne, :'pa-PK', :pl, :pt, :ru, :th, :tl, :tr, :ur, :vi, :zh ]

# Languages metadata
config[:langs_meta] = {
  :ar => { :dir => 'rtl', :name => "&#x0627;&#x0644;&#x0639;&#x0631;&#x0628;&#x064A;&#x0629;", :name_en => 'Arabic',
           :youtube_id => 'Emt92Mc7N8c' },
  :de => { :dir => 'ltr', :name => "Deutsch", :name_en => 'German',
           :youtube_id => 'b9WXgHV549s' },
  :en => { :dir => 'ltr', :name => "English", :name_en => 'English',
           :youtube_id => 'q3HjXdXDtb4' },
  :es => { :dir => 'ltr', :name => "Español", :name_en => 'Spanish',
           :youtube_id => 'U9dkuuTutpk' },
  :fr => { :dir => 'ltr', :name => "Fran&ccedil;ais", :name_en => 'French',
           :youtube_id => 'UvvTFtoMEt0' },
  :hi => { :dir => 'ltr', :name => "&#x0939;&#x093F;&#x0928;&#x094D;&#x200D;&#x0926;&#x0940;", :name_en => 'Hindi',
           :youtube_id => '7sqbdppPc2Y' },
  :id => { :dir => 'ltr', :name => "Bahasa Indonesia", :name_en => 'Indonesian',
           :youtube_id => '8JWShow4OKk' },
  :it => { :dir => 'ltr', :name => "Italiano", :name_en => 'Italian',
           :youtube_id => nil, :youtube_cc => true },
  :ja => { :dir => 'ltr', :name => "&#x65E5;&#x672C;&#x8A9E;", :name_en => 'Japanese',
           :youtube_id => '2YoPVyTqwa0' },
  :ko => { :dir => 'ltr', :name => "&#xD55C;&#xAD6D;&#xC5B4;", :name_en => 'Korean',
           :youtube_id => 'jUJTVn6a7X4' },
  :ne => { :dir => 'ltr', :name => "&#x928;&#x947;&#x92a;&#x93e;&#x932;&#x940;", :name_en => 'Nepali',
           :youtube_id => nil, :youtube_cc => true },
  :'pa-PK' => { :dir => 'rtl', :name => "پنجابی", :name_en => 'Punjabi, Pakistan',
           :youtube_id => 'XSX2_EBua_8' },
  :pl => { :dir => 'ltr', :name => "Polski", :name_en => 'Polish',
           :youtube_id => 'LZzR3ETjGJ4' },
  :pt => { :dir => 'ltr', :name => "Portugu&ecirc;s", :name_en => 'Portuguese',
           :youtube_id => nil, :youtube_cc => true },
  :ru => { :dir => 'ltr', :name => "&#x0420;&#x0443;&#x0441;&#x0441;&#x043A;&#x0438;&#x0439;&nbsp;(Russkij)", :name_en => 'Russian',
           :youtube_id => 'y34knCgibHM' },
  :th => { :dir => 'ltr', :name => "&#x0E44;&#x0E17;&#x0E22;", :name_en => 'Thai',
           :youtube_id => nil, :youtube_cc => true },
  :tl => { :dir => 'ltr', :name => "Tagalog", :name_en => 'Tagalog',
           :youtube_id => nil, :youtube_cc => true },
  :tr => { :dir => 'ltr', :name => "T&uuml;rk&ccedil;e", :name_en => 'Turkish',
           :youtube_id => 'Dy4qIwOwEuo' },
  :ur => { :dir => 'rtl', :name => "اُردُو", :name_en => 'Urdu',
           :youtube_id => '13giSgXM0T8' },
  :vi => { :dir => 'ltr', :name => "Ti&#7871;ng Vi&#7879;t", :name_en => 'Vietnamese',
           :youtube_id => 'siZ8VFjDjo0' },
  :zh => { :dir => 'ltr', :name => "&#x4E2D;&#x6587;", :name_en => 'Chinese',
           :youtube_id => 'iUPQZ_pzzFc', :vimeo_id => '141090381' },
}

# Facebook Pixel id's for each language
config[:facebook_pixel] = {
  :default => { :page_view => '6028906726051', :video_played => nil },
  :ar	   => { :page_view => '6037600879992', :video_played => '' },
  :de	   => { :page_view => '6037601190992', :video_played => '' },
  :en	   => { :page_view => '6037275053392', :video_played => '' },
  :es	   => { :page_view => '6037273261392', :video_played => '' },
  :fr	   => { :page_view => '6037274956792', :video_played => '' },
  :hi	   => { :page_view => '6037600978992', :video_played => '' },
  :id	   => { :page_view => '6037275097592', :video_played => '' },
  :it	   => { :page_view => '6037658688592', :video_played => '' },
  :ja	   => { :page_view => '6037601034392', :video_played => '' },
  :ko	   => { :page_view => '6037601102392', :video_played => '' },
  :ne	   => { :page_view => '6037658877592', :video_played => '' },
  :'pa-PK' => { :page_view => '6037275136792', :video_played => '' },
  :pl	   => { :page_view => '6037275178392', :video_played => '' },
  :pt	   => { :page_view => '6037672919192', :video_played => '' },
  :ru	   => { :page_view => '6037275206792', :video_played => '' },
  :th	   => { :page_view => '6037658787392', :video_played => '' },
  :tl	   => { :page_view => '6037601281792', :video_played => '' },
  :tr	   => { :page_view => '6037601327592', :video_played => '' },
  :ur	   => { :page_view => '6037275233192', :video_played => '' },
  :vi	   => { :page_view => '6037275262792', :video_played => '' },
  :zh	   => { :page_view => '6037394214792', :video_played => '' },
}

# Support Apache .htaccess
page 'htaccess.txt', :layout => false
# Rename file after build
after_build do
  File.rename 'build/htaccess.txt', 'build/.htaccess'
end

activate :deploy do |deploy|
  deploy.method		= :sftp
  deploy.host		= 'oct7lastday.com'
  deploy.path		= case ENV['MM_ENV']
    when 'production' then '/home/oct7lastday/public_html'
    when 'staging' then '/home/oct7lastday/staging/build'
    end
  # Optional Settings
  deploy.user  = 'oct7lastday' # no default
  # deploy.port  = 5309 # ssh port, default: 22
  deploy.clean = true # remove orphaned files on remote host, default: false
  # deploy.flags = '-rltgoDvzO --no-p --del' # add custom flags, default: -avz
end

