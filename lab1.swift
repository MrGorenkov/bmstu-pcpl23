import Foundation

func calculateQuadraticEquation() {
    var a: Double = 0.0
    var b: Double = 0.0
    var c: Double = 0.0

    // Ввод коэффициентов с клавиатуры или из командной строки
    if CommandLine.arguments.count >= 4 {
        if let aInput = Double(CommandLine.arguments[1]),
           let bInput = Double(CommandLine.arguments[2]),
           let cInput = Double(CommandLine.arguments[3]) {
            a = aInput
            b = bInput
            c = cInput
        } else {
            print("Ошибка: Коэффициенты А, В, С должны быть числами.")
            return
        }
    } else {
        print("Введите коэффициент А:")
        if let aInput = readLine(), let aDouble = Double(aInput) {
            a = aDouble
        } else {
            print("Ошибка: Некорректное значение для коэффициента А.")
            return
        }

        print("Введите коэффициент В:")
        if let bInput = readLine(), let bDouble = Double(bInput) {
            b = bDouble
        } else {
            print("Ошибка: Некорректное значение для коэффициента В.")
            return
        }

        print("Введите коэффициент С:")
        if let cInput = readLine(), let cDouble = Double(cInput) {
            c = cDouble
        } else {
            print("Ошибка: Некорректное значение для коэффициента С.")
            return
        }
    }

    // Вычисление дискриминанта
    let discriminant = b * b - 4 * a * c

    if discriminant > 0 {
        // Два действительных корня
        let root1 = (-b + sqrt(discriminant)) / (2 * a)
        let root2 = (-b - sqrt(discriminant)) / (2 * a)
        print("Два действительных корня: x1 = \(root1), x2 = \(root2)")
    } else if discriminant == 0 {
        // Один действительный корень
        let root = -b / (2 * a)
        print("Один действительный корень: x = \(root)")
    } else {
        // Действительных корней нет
        print("Действительных корней нет")
    }

    // Вычисление корней биквадратного уравнения
    let sqrtDiscriminant = sqrt(abs(discriminant))
    let x1 = (-b + sqrtDiscriminant) / (2 * a)
    let x2 = (-b - sqrtDiscriminant) / (2 * a)

    if discriminant > 0 {
        // Два корня
        let y1 = sqrt(x1)
        let y2 = -sqrt(x1)
        let z1 = sqrt(x2)
        let z2 = -sqrt(x2)
        print("Биквадратное уравнение имеет 4 корня:")
        print("x1 = \(y1), x2 = \(y2), x3 = \(z1), x4 = \(z2)")
    } else if discriminant == 0 {
        // Один корень
        if x1 >= 0 {
            let y1 = sqrt(x1)
            let y2 = -sqrt(x1)
            print("Биквадратное уравнение имеет 2 корня:")
            print("x1 = \(y1), x2 = \(y2)")
        } else {
            print("Биквадратное уравнение не имеет действительных корней.")
        }
    } else {
        // Действительных корней нет
        print("Биквадратное уравнение не имеет действительных корней.")
    }
}

calculateQuadraticEquation()
