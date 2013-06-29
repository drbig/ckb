%w{ rubygems rake/gempackagetask }.each {|g| require g }

spec = Gem::Specification.new do |s|
  s.name = 'ckb'
  s.version = '0.0.1'
  s.date = Time.now
  s.summary = 'Custom keyboard event processor'
  s.description = 'This software lets you easily define a keymap and provides a daemon that will execute your Ruby code on each associated keypress. It is simple and hacky solution to handle things like IR remote controls that get attached to all sorts of consumer electronics nowadays.'
  s.authors = ['Piotr S. Staszewski']
  s.email = 'p.staszewski@gmail.com'
  s.files = FileList['bin/*', 'examples/*.rb', 'lib/*.rb', '[A-Z]*'].to_a
  s.executables = %w{ ckbd ckb-mkmap } 
  s.homepage = 'http://www.drbig.one.pl'
end

Rake::GemPackageTask.new(spec) do |pkg|
  pkg.need_tar = true
end

task :default => "pkg/#{spec.name}-#{spec.version}.gem" do
  puts 'built gem'
end
