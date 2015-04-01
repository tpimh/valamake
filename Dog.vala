namespace Example {
class Dog : Animal {
    public Dog(string name) {
        this.name = name;
    }

    public override string name { get; set; }

    public override string voice() {
        return "Woof!";
    }
}
}
