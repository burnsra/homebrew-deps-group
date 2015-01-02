require "formula"

class BrewDepsGroup < Formula
    homepage "https://github.com/shulhi/homebrew-deps-group"
    url "https://github.com/shulhi/homebrew-deps-group.git"

    depends_on :python if MacOS.version <= :snow_leopard

    resource "networkx" do
        url "https://pypi.python.org/packages/source/n/networkx/networkx-1.9.1.tar.gz"
        # md5 "a2d9ee8427c5636426f319968e0af9f2"
    end

    skip_clean "bin"

    def install
        ENV.prepend_create_path "PYTHONPATH", libexec/"vendor/lib/python2.7/site-packages"
        %w[networkx].each do |r|
            resource(r).stage do
                system "python", *Language::Python.setup_install_args(libexec/"vendor")
            end
        end

        bin.install 'brew-deps-group.py'
        bin.install 'brew-deps-group.rb'
        (bin + 'brew-deps-group.py').chmod 0755
        (bin + 'brew-deps-group.rb').chmod 0755
    end
end