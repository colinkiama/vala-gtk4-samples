public class TextFileViewerSample : Gtk.Application {
    private Gtk.TextView text_view;
    private Gtk.ApplicationWindow window;

    public TextFileViewerSample () {
        Object (application_id: "com.example.TextFileViewerSample");
    }

    public override void activate () {
        this.window = new Gtk.ApplicationWindow (this) {
            title = "Text File Viewer",
            default_width = 400,
            default_height = 300
        };

        var toolbar = new Gtk.Box (Gtk.Orientation.VERTICAL, 0);
        toolbar.add_css_class ("toolbar");

        var open_button = new Gtk.Button.from_icon_name ("document-open") {
            label = "Open"
        };

        open_button.clicked.connect(on_open_button_clicked);
        toolbar.append (open_button);

        text_view = new Gtk.TextView () {
            editable = false,
            cursor_visible = false,
        };

        var scroll_view = new Gtk.ScrolledWindow () {
            hscrollbar_policy = Gtk.PolicyType.AUTOMATIC,
            vscrollbar_policy = Gtk.PolicyType.AUTOMATIC,
            vexpand = true,
            valign = Gtk.Align.FILL
        };

        scroll_view.child = this.text_view;

        var vbox = new Gtk.Box (Gtk.Orientation.VERTICAL, 0);
        vbox.append (toolbar);
        vbox.append (scroll_view);

        this.window.child = vbox;
        this.window.present ();
    }

    private void on_open_button_clicked () {
        var file_dialog = new Gtk.FileDialog () {
            title = "Open File"
        };

        file_dialog.open.begin (this.window, null, (obj, res) => {
            try {
                var file = file_dialog.open.end (res);
                uint8[] contents;
                file.load_contents (null, out contents, null);
                this.text_view.buffer.text = (string) contents;
            } catch (Error e) {
                stderr.printf ("Error: %s\n", e.message);
            }
        });
    }

    public static int main (string[] args) {
        var app = new TextFileViewerSample ();
        return app.run (args);
    }
}
