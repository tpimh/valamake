namespace Example {
class Cat : Animal {
    public Cat(string name) {
        this.name = name;
    }

    public override string name { get; set; }

    public override string voice() {
        return "Meaow!";
    }
}
}
