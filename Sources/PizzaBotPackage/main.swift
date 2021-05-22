import PizzaBotPackageLib

var output = ValidationError.commandDoesNotExist.localizedDescription

if CommandLine.argc == 2 {
    do {
        let router = Router()
        let input = CommandLine.arguments[1]
        output = try router.getDeliveryRoute(input: input)
    } catch {
        output = error.localizedDescription
    }
}

print(output)
