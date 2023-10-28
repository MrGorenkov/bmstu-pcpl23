class HardDrive:
    def __init__(self, hd_id, capacity_gb, computer_id):
        self.hd_id = hd_id
        self.capacity_gb = capacity_gb
        self.computer_id = computer_id

class Computer:
    def __init__(self, computer_id, brand, model):
        self.computer_id = computer_id
        self.brand = brand
        self.model = model
        self.hard_drives = []

    def add_hard_drive(self, hard_drive):
        self.hard_drives.append(hard_drive)

# Создаем объекты класса Computer
computer1 = Computer(1, "Dell", "XPS 13")
computer2 = Computer(2, "HP", "Pavilion")

# Создаем объекты класса HardDrive и связываем их с компьютерами
hard_drive1 = HardDrive(1, 512, 1)
hard_drive2 = HardDrive(2, 256, 1)
hard_drive3 = HardDrive(3, 1000, 2)

computer1.add_hard_drive(hard_drive1)
computer1.add_hard_drive(hard_drive2)
computer2.add_hard_drive(hard_drive3)

# Создаем список "Компьютеры и их жесткие диски"
computers_and_hard_drives = [
    (computer1, hard_drive1),
    (computer1, hard_drive2),
    (computer2, hard_drive3)
]


# Запрос 1: Вывести список всех компьютеров, у которых бренд начинается с буквы "D", и модели их жестких дисков
print("\nЗапрос 1: Список всех компьютеров, у которых бренд начинается с буквы 'D', и модели их жестких дисков")
for computer, hard_drive in computers_and_hard_drives:
    if computer.brand.startswith("D"):
        print(f"Компьютер: {computer.brand} {computer.model}, Модель жесткого диска: {hard_drive.capacity_gb} ГБ")


# Запрос 2: Вывести список компьютеров с наименьшим объемом жестких дисков
print("\nЗапрос 2: Список компьютеров с наименьшим объемом жестких дисков")
min_capacity_by_computer = {}
for computer, hard_drive in computers_and_hard_drives:
    if computer.computer_id in min_capacity_by_computer:
        if hard_drive.capacity_gb < min_capacity_by_computer[computer.computer_id]:
            min_capacity_by_computer[computer.computer_id] = hard_drive.capacity_gb
    else:
        min_capacity_by_computer[computer.computer_id] = hard_drive.capacity_gb

sorted_computers = sorted(min_capacity_by_computer.items(), key=lambda x: x[1])
for computer_id, min_capacity in sorted_computers:
    computer = next(c for c in [computer for computer, _ in computers_and_hard_drives] if c.computer_id == computer_id)
    print(f"Компьютер: {computer.brand} {computer.model}, Минимальный объем жесткого диска: {min_capacity} ГБ")

# Запрос 3: Вывести список всех компьютеров и их жестких дисков (произвольная сортировка)
print("\nЗапрос 3: Список всех компьютеров и их жестких дисков (произвольная сортировка)")
sorted_computers_and_hard_drives = sorted(computers_and_hard_drives, key=lambda x: (x[0].brand, x[0].model))
for computer, hard_drive in sorted_computers_and_hard_drives:
    print(f"Компьютер: {computer.brand} {computer.model}, Жесткий диск: {hard_drive.capacity_gb} ГБ")
