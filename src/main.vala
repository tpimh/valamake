using Gee;

void main() {
    ArrayList<Animal> list = new ArrayList<Animal>();

    list.add(new Cat("Tom"));
    list.add(new Mouse("Jerry"));
    list.add(new Dog("Spike"));

    foreach (Animal a in list) {
        stdout.printf(GLib.Type.from_instance(a).name() + @" named $(a.name)\n");
    }
}
