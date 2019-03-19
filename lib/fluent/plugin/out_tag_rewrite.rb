require "fluent/plugin/output"

class Fluent::Plugin::TagRewriteOutput < Fluent::Plugin::Output
  Fluent::Plugin.register_output("tag_rewrite", self)

  helpers :event_emitter

  config_param :tag_prefix, :string, :default => nil
  config_param :tag_suffix, :string, :default => nil

  def configure(conf)
    super

    if @tag_prefix.nil? && @tag_prefix.nil?
      raise Fluent::ConfigError, "Neither tag_prefix nor tag_suffix has not been provided"
    end
  end

  def multi_workers_ready?
    true
  end

  def process(tag, es)
    es.each do |time, record|
      begin
        rewritten_tag = tag
        unless @tag_prefix.nil?
          rewritten_tag = @tag_prefix + "." + rewritten_tag
        end
        unless @tag_suffix.nil?
          rewritten_tag = rewritten_tag + "." + @tag_suffix
        end
        router.emit(rewritten_tag, time, record)
      rescue
        $log.error("unexpected error in tag_rewrite", :error => $!.to_s)
        $log.error_backtrace
      end
    end
  end
end
