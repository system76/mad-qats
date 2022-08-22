use cstr::cstr;
use qmetaobject::prelude::*;

// The `QObject` custom derive macro allows to expose a class to Qt and QML
#[derive(QObject, Default)]
struct Greeter {
    // Specify the base class with the qt_base_class macro
    base: qt_base_class!(trait QObject),
    // Declare `name` as a property usable from Qt
    name: qt_property!(QString; NOTIFY name_changed),
    // Declare a signal
    name_changed: qt_signal!(),
    // And even a slot
    compute_greetings: qt_method!(fn compute_greetings(&self, verb: String) -> QString {
        format!("{} {}", verb, self.name.to_string()).into()
    })
}

qrc!(my_resource,
    "mad-qats/qml" {
        "main.qml",
        "CheckListItem.qml"
    },
);


fn main() {
    // Register the `Greeter` struct to QML
    my_resource();
    qml_register_type::<Greeter>(cstr!("Greeter"), 1, 0, cstr!("Greeter"));
 
    let mut engine = QmlEngine::new();
    engine.load_file("qrc:/mad-qats/qml/main.qml".into());
    engine.exec();
    

}
