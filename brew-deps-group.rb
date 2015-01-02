require 'keg'
require 'formula'

module BrewDepsGroup

  USAGE = <<-EOS.undent
  DESCRIPTION

  USAGE
    brew deps-group
  EOS

  module_function

  def run
    if ['-h', '?', '--help'].include? ARGV.first
      puts USAGE
      exit 0
    end

    if ['-a', '--all'].include? ARGV.first
      system "brew-deps-group.py", "all"
    end

    if ARGV.empty?
      system "brew-deps-group.py", "top"
    end
  end
end

BrewDepsGroup.run
exit 0
