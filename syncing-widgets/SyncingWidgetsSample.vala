public class SyncSample : Gtk.Application {
    private Gtk.SpinButton spin_box;
    private Gtk.Scale slider;
    
    public SyncSample () {
        Object (application_id: "com.example.SyncSample");
    }

    public override void activate () {
        var window = new Gtk.ApplicationWindow (this);
        window.set_default_size (300, 20);

        spin_box = new Gtk.SpinButton.with_range (0, 130, 1);
        slider = new Gtk.Scale.with_range (Gtk.Orientation.HORIZONTAL, 0, 130, 1);
        
        spin_box.adjustment.value_changed.connect (() => {
            slider.adjustment.value = spin_box.adjustment.value;
        });
        
        slider.adjustment.value_changed.connect (() => {
            spin_box.adjustment.value = slider.adjustment.value;
        });
        
        var hbox = new Gtk.Box (Gtk.Orientation.HORIZONTAL, 5);
        hbox.homogeneous = true;
        hbox.append (spin_box);
        hbox.append (slider);

        window.child = hbox;
        window.present ();
    }

    public static int main (string[] args) {
        var app = new SyncSample ();
        return app.run (args);
    }
}
