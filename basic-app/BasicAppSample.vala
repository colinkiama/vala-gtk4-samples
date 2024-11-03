public class BasicAppSample : Gtk.Application {
    public BasicAppSample () {
        Object (application_id: "com.example.BasicAppSample");
    }

    public override void activate () {
        var window = new Gtk.ApplicationWindow (this);

        var button = new Gtk.Button.with_label ("Click me!");
        button.clicked.connect (() => {
            button.label = "Thank you";
        });

        window.child = button;
        window.present ();
    }

    public static int main (string[] args) {
        var app = new BasicAppSample ();
        return app.run (args);
    }
}
