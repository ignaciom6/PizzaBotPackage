if CommandLine.argc < 2 {
    print(ValidationError.commandDoesNotExist.localizedDescription)
} else {
    do {
        let router = Router()
        let input = CommandLine.arguments[1]
        print(try router.getDeliveryRoute(input: input))
    } catch {
        print(error.localizedDescription)
    }
}
