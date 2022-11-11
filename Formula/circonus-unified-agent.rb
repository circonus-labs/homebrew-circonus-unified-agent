# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class CirconusUnifiedAgent < Formula
  desc "Circonus Unified Agent"
  homepage "https://circonus.com"
  version "0.2.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/circonus-labs/circonus-unified-agent/releases/download/v0.2.2/circonus-unified-agent_0.2.2_darwin_arm64.tar.gz"
      sha256 "4702ad996d94c48b02534005eb1ed35760f61a807b044a9f3cc7a7f671447009"

      def install
        sbin.install "sbin/circonus-unified-agentd"
        pkgetc.install "etc/example-circonus-unified-agent.conf" => "circonus-unified-agent.conf"
        (pkgetc/"conf.d").mkpath
        doc.install "README.md", "LICENSE"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/circonus-labs/circonus-unified-agent/releases/download/v0.2.2/circonus-unified-agent_0.2.2_darwin_x86_64.tar.gz"
      sha256 "cbf69940abbd278a947e9fe0c2d3a88ccd19a632c4a2b1c6a90b7b8b07b1a0df"

      def install
        sbin.install "sbin/circonus-unified-agentd"
        pkgetc.install "etc/example-circonus-unified-agent.conf" => "circonus-unified-agent.conf"
        (pkgetc/"conf.d").mkpath
        doc.install "README.md", "LICENSE"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/circonus-labs/circonus-unified-agent/releases/download/v0.2.2/circonus-unified-agent_0.2.2_linux_arm64.tar.gz"
      sha256 "4af64a8766d3df2684d51111464babef28e555e0cb83743bc8a4176c8ca4be96"

      def install
        sbin.install "sbin/circonus-unified-agentd"
        pkgetc.install "etc/example-circonus-unified-agent.conf" => "circonus-unified-agent.conf"
        (pkgetc/"conf.d").mkpath
        doc.install "README.md", "LICENSE"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/circonus-labs/circonus-unified-agent/releases/download/v0.2.2/circonus-unified-agent_0.2.2_linux_x86_64.tar.gz"
      sha256 "81520292c6e2f94c63503fb639c17435121103f382c9da1dd4615b243f5e2f2a"

      def install
        sbin.install "sbin/circonus-unified-agentd"
        pkgetc.install "etc/example-circonus-unified-agent.conf" => "circonus-unified-agent.conf"
        (pkgetc/"conf.d").mkpath
        doc.install "README.md", "LICENSE"
      end
    end
  end

  def caveats
    <<~EOS
      1. Edit #{pkgetc}/circonus-unified-agent.conf to add your API key.
      2. Run brew service start circonus-unified-agent

      Or, if upgrading, brew service restart circonus-unified-agent
    EOS
  end

  service do
    run [opt_sbin/"circonus-unified-agentd", "--config", etc/"circonus-unified-agent/circonus-unified-agent.conf", "--config-directory", etc/"circonus-unified-agent/conf.d"]
    keep_alive true
    log_path var/"log/circonus-unified-agent.log"
    error_log_path var/"log/circonus-unified-agent.log"
  end

  test do
    system "#{sbin}/circonus-unified-agentd --version"
  end
end
