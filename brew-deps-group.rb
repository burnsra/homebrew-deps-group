require 'keg'
require 'formula'

module BrewDepsGroup

  USAGE = <<-EOS.undent
  DESCRIPTION
    `rmtree` allows you to remove a formula entirely, including all of its dependencies,
    unless of course, they are used by another formula.

    Warning:

      Not all formulas declare their dependencies and therefore this command may end up
      removing something you still need. It should be used with caution.

  USAGE
    brew rmtree formula1 [formula2] [formula3]...

    Examples:

      brew rmtree gcc44 gcc48   # Removes 'gcc44' and 'gcc48' and their dependencies
  EOS

  module_function

  def depsGroup
    system "python",
    # if ARGV.size < 1 or ['-h', '?', '--help'].include? ARGV.first
    #   puts USAGE
    #   exit 0
    # end
end

BrewDepsGroup.depsGroup
exit 0
