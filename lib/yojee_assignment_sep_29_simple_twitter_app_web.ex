defmodule YojeeAssignmentSep29SimpleTwitterAppWeb do
  @moduledoc """
  The entrypoint for defining your web interface, such
  as controllers, views, channels and so on.

  This can be used in your application as:

      use YojeeAssignmentSep29SimpleTwitterAppWeb, :controller
      use YojeeAssignmentSep29SimpleTwitterAppWeb, :view

  The definitions below will be executed for every view,
  controller, etc, so keep them short and clean, focused
  on imports, uses and aliases.

  Do NOT define functions inside the quoted expressions
  below. Instead, define any helper function in modules
  and import those modules here.
  """

  def controller do
    quote do
      use Phoenix.Controller, namespace: YojeeAssignmentSep29SimpleTwitterAppWeb

      import Plug.Conn
      import YojeeAssignmentSep29SimpleTwitterAppWeb.Gettext
      alias YojeeAssignmentSep29SimpleTwitterAppWeb.Router.Helpers, as: Routes
    end
  end

  def view do
    quote do
      use Phoenix.View,
        root: "lib/yojee_assignment_sep_29_simple_twitter_app_web/templates",
        namespace: YojeeAssignmentSep29SimpleTwitterAppWeb

      # Import convenience functions from controllers
      import Phoenix.Controller,
        only: [get_flash: 1, get_flash: 2, view_module: 1, view_template: 1]

      # Include shared imports and aliases for views
      unquote(view_helpers())
    end
  end

  def live_view do
    quote do
      use Phoenix.LiveView,
        layout: {YojeeAssignmentSep29SimpleTwitterAppWeb.LayoutView, "live.html"}

      unquote(view_helpers())
    end
  end

  def live_component do
    quote do
      use Phoenix.LiveComponent

      unquote(view_helpers())
    end
  end

  def router do
    quote do
      use Phoenix.Router

      import Plug.Conn
      import Phoenix.Controller
      import Phoenix.LiveView.Router
    end
  end

  def channel do
    quote do
      use Phoenix.Channel
      import YojeeAssignmentSep29SimpleTwitterAppWeb.Gettext
    end
  end

  defp view_helpers do
    quote do
      # Use all HTML functionality (forms, tags, etc)
      use Phoenix.HTML

      # Import LiveView helpers (live_render, live_component, live_patch, etc)
      import Phoenix.LiveView.Helpers
      import YojeeAssignmentSep29SimpleTwitterAppWeb.LiveHelpers

      # Import basic rendering functionality (render, render_layout, etc)
      import Phoenix.View

      import YojeeAssignmentSep29SimpleTwitterAppWeb.ErrorHelpers
      import YojeeAssignmentSep29SimpleTwitterAppWeb.Gettext
      alias YojeeAssignmentSep29SimpleTwitterAppWeb.Router.Helpers, as: Routes
    end
  end

  @doc """
  When used, dispatch to the appropriate controller/view/etc.
  """
  defmacro __using__(which) when is_atom(which) do
    apply(__MODULE__, which, [])
  end
end
