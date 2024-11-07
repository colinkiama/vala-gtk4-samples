public class Item : GLib.Object {
    public string name { get; set; }
    public bool checked { get; set; }

    public Item (string name, bool checked) {
        Object (
            name: name,
            checked: checked
        );
    }
}

public class ListViewSample : Gtk.Application {
    public ListViewSample () {
        Object (application_id: "com.example.ListViewCheckboxesSample");
    }

    public override void activate () {
        var window = new Gtk.ApplicationWindow (this) {
            title = "ListView Checkboxes Sample",
            default_width = 280,
            default_height = 200
        };

        var items = new GLib.ListStore(typeof (Item));
        var selection_model = new Gtk.SingleSelection (items) {
            autoselect = true
        };

        items.append (new Item ("Item 1", true));
        items.append (new Item ("Item 2", false));

        var list_view_factory = new Gtk.SignalListItemFactory ();
        list_view_factory.setup.connect (on_list_view_setup);
        list_view_factory.bind.connect (on_list_view_bind);

        var list_view = new Gtk.ListView (selection_model, list_view_factory);

        window.child = list_view;
        window.present ();
    }

    private void on_list_view_setup (Gtk.SignalListItemFactory factory, GLib.Object list_item_obj) {
        var vbox = new Gtk.Box (Gtk.Orientation.HORIZONTAL, 0);
        var checkbox = new Gtk.CheckButton ();
        var name_label = new Gtk.Label ("");
        name_label.halign = Gtk.Align.START;

        vbox.append (checkbox);
        vbox.append (name_label);
        (list_item_obj as Gtk.ListItem).child = vbox;
    }

    private void on_list_view_bind (Gtk.SignalListItemFactory factory, GLib.Object list_item_obj) {
        var list_item = list_item_obj as Gtk.ListItem;
        var item_data = list_item.item as Item;
        var vbox = list_item.child as Gtk.Box;
        var checkbox = vbox.get_first_child () as Gtk.CheckButton;
        var name_label = checkbox.get_next_sibling () as Gtk.Label;

        checkbox.active = item_data.checked;
        name_label.label = item_data.name;
    }

    private void on_list_view_header_setup (Gtk.SignalListItemFactory factory, GLib.Object list_header_obj) {
        var header_label = new Gtk.Label ("");
        header_label.halign = Gtk.Align.START;
        (list_header_obj as Gtk.ListHeader).child = header_label;
    }

    public static int main (string[] args) {
        var app = new ListViewSample ();
        return app.run (args);
    }
}

