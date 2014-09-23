require "formula"

class Libxmlxx < Formula
  homepage "http://libxmlplusplus.sourceforge.net"
  url "http://ftp.gnome.org/pub/GNOME/sources/libxml++/2.36/libxml++-2.36.0.tar.xz"
  sha256 "bfdf327bf9ebd12946b7aa6a152045f209d5c9fecd06ebfcdf9b3e7c1af6e2e1"

  bottle do
  end

  depends_on "pkg-config" => :build
  depends_on "glibmm"
  # LibXML++ can't compile agains the version of LibXML shipped with Leopard
  depends_on "libxml2" if MacOS.version <= :leopard

  def install
    system "./configure", "--disable-dependency-tracking", "--prefix=#{prefix}"
    system "make install"
  end
end
