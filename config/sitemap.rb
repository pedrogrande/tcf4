# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = 'https://thecoderfactory.com'

SitemapGenerator::Sitemap.create do
  add '/contact'
  add '/about'
  add '/blog', :changefreq => 'daily'
  add '/privacy'

  Post.find_each do |post|
    add post_path(post), :lastmod => post.updated_at
  end

  Profile.find_each do |profile|
    add profile_path(profile), :lastmod => profile.updated_at
  end

  PopularProgramme.find_each do |programme|
    add popular_programme_path(programme), :lastmod => programme.updated_at
  end

  Location.find_each do |location|
    add location_path(location), :lastmod => location.updated_at
  end

  Unit.find_each do |unit|
    add unit_path(unit), :lastmod => unit.updated_at
  end
end