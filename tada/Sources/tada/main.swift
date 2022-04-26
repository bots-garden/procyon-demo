import Suborbital

class Tada: Suborbital.Runnable {
    func run(input: String) -> String {

        return "👋 Hello " + input + ", what's up? 😃"
    }
}

Suborbital.Set(runnable: Tada())
