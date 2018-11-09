# Print all the gems installed in the ChefDK omnibus as a JSON hash. This is
# stored in the root of the ChefDK install next to the `version-manifest.json`.

all_gems = {}

Gem::Specification.each_spec do |spec|
  all_gems[gem.name] ||= []
  all_gems[gem.name] << gem.version.to_s
end

require 'json'
j = JSON.generate(all_gems)

manifest_file = ARGV[0]
File.open(manifest_file, "w") do |f|
  f.write(j)
end
