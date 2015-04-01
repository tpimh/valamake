namespace Example {
class World : Object {
    public static int main (string[] args) {
        List<Animal> animals = new List<Animal>();

        foreach (string s in new string[] { "Oscar", "Thomas", "Jasper", "Felix", "Misty" })
            animals.append(new Cat(s));
        foreach (string s in new string[] { "Spot", "Rover", "Scooby", "Lassie", "Snoopy" })
            animals.append(new Dog(s));

        foreach (Animal a in animals)
            stdout.printf("%s says: \"%s\"\n", a.name, a.voice());

        return 0;
    }
}
}
