module AppHelpers
    PARTIAL_PREFIX = "_"

    # Renders a _partial in the "/shared" directory.
    # Example:
    #   shared_partial(:flash_box)
    def shared_partial(*args)
        partial_name = args.shift.to_sym
        partial_in(SharedController, partial_name, *args)
    end

    # Renders a _partial in the current controller
    # Example:
    #   partial(:the_partial)
    def partial(*args)
        partial_name = args.shift.to_s
        partial_name = PARTIAL_PREFIX + partial_name
        render_partial(partial_name, *args)
    end

    # Renders a _partial in another controller
    # Example:
    #   partial_in(SampleController, :the_partial)
    def partial_in(controller, partial_name, *args)
        partial_name = PARTIAL_PREFIX + partial_name.to_s
        begin
            controller.render_partial(partial_name, *args)
        rescue
            Ramaze::Log.error("Error loading partial #{controller.to_s}.#{partial_name}")
            raise $!
        end
    end

    # Toggle table row class for list formatting
    def cycle
        (@isodd = !@isodd) ? 'even' : 'odd'
    end

    def fmt_date dt, fmt='%d-%m-%Y'
        dt.strftime(fmt) if dt
    end
end
