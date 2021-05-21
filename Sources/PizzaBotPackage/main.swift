import PizzaBotPackageLib

var output: String = ""

if CommandLine.argc < 2 {
    output = ValidationError.commandDoesNotExist.localizedDescription
} else {
    do {
        let router = Router()
        let input = CommandLine.arguments[1]
        output = try router.getDeliveryRoute(input: input)
    } catch {
        output = error.localizedDescription
    }
}

print(output)
