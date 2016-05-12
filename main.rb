# quu..__
#  $$$b  `---.__
#   "$$b        `--.                          ___.---uuudP
#    `$$b           `.__.------.__     __.---'      $$$$"              .
#      "$b          -'            `-.-'            $$$"              .'|
#        ".                                       d$"             _.'  |
#          `.   /                              ..."             .'     |
#            `./                           ..::-'            _.'       |
#             /                         .:::-'            .-'         .'
#            :                          ::''\          _.'            |
#           .' .-.             .-.           `.      .'               |
#           : /'$$|           .@"$\           `.   .'              _.-'
#          .'|$u$$|          |$$,$$|           |  <            _.-'
#          | `:$$:'          :$$$$$:           `.  `.       .-'
#          :                  `"--'             |    `-.     \
#         :##.       ==             .###.       `.      `.    `\
#         |##:                      :###:        |        >     >
#         |#'     `..'`..'          `###'        x:      /     /
#          \                                   xXX|     /    ./
#           \                                xXXX'|    /   ./
#           /`-.                                  `.  /   /
#          :    `-  ...........,                   | /  .'
#          |         ``:::::::'       .            |<    `.
#          |             ```          |           x| \ `.:``.
#          |                         .'    /'   xXX|  `:`M`M':.
#          |    |                    ;    /:' xXXX'|  -'MMMMM:'
#          `.  .'                   :    /:'       |-'MMMM.-'
#           |  |                   .'   /'        .'MMM.-'
#           `'`'                   :  ,'          |MMM<
#             |                     `'            |tbap\
#              \                                  :MM.-'
#               \                 |              .''
#                \.               `.            /
#                 /     .:::::::.. :           /
#                |     .:::::::::::`.         /
#                |   .:::------------\       /
#               /   .''               >::'  /
#               `',:                 :    .'


$bridges = ['o-o-o', '|\| |', 'o-o o'] # хранит мосты
$leftedge = '|  ' # всякие паттерны тут
$leftedgealt = '| |'
$leftislands = 'o-o-o'


def m_five(n)
  if n == 4
    for i in 3..7
      $bridges<<('')
      $bridges[0] = 'o-o-o-o-o'
      $bridges[1] = '|\ \|/ /|'
      $bridges[2] = 'o-o o o-o'
      $bridges[3] = '| |   | |'
      $bridges[4] = 'o-o o o-o'
      $bridges[5] = '|/ /|\ \|'
      $bridges[6] = 'o-o-o-o-o'
    end
  else
    for i in 3..(n * 2 - 1)
      $bridges<<('')
      $bridges[0] << '-o-o'
      $bridges[1] << ' |\|'
      $bridges[2] << ' o-o'
      $bridges[3] = '|  / \  |'
      $bridges[4] = $bridges[0]
      for i in 5..(n * 2 - 6)
        if i % 4 == 1
          $bridges[i] = '|   |   |'
        elsif i % 2 == 0
          $bridges[i] = $bridges[0]
        else
          $bridges[i] = '| |   | |'
          $bridges[2 * n - 6] = $bridges[0]
          $bridges[2 * n - 5] = '|  \ /  |'
          $bridges[2 * n - 4] = $bridges[2]
          $bridges[2 * n - 3] = '|\| | |/|'
          $bridges[2 * n - 2] = $bridges[0]
        end
      end
    end
  end
end

def m_uneven(m, n)
  while $bridges[0].length != m * 2 - 1
    $bridges[0] << '-o'
  end
  while $bridges[1].length != m * 2 - 3
    $bridges[1] << ' |'
  end
  $bridges[1] << '/|'
  while $bridges[2].length != m * 2 - 5
    $bridges[2] << '-o'
  end
  $bridges[2] << ' o-o'
  for i in 3..(n * 2 - 1)
    $bridges<<('')
  end
  for i in 3..(n * 2 - 4)
    if i % 2 == 0
      $bridges[i] << $leftislands
      while $bridges[i].length != m * 2 - 1
        $bridges[i] << '-o'
      end
    else
      if i % 4 == 1
        $bridges[i] << $leftedgealt
        while $bridges[i].length != m * 2 - 4
          $bridges[i] << ' '
        end
        $bridges[i] << '| |'
      else
        $bridges[i] << $leftedge
        while $bridges[i].length != m * 2 - 5
          $bridges[i] << ' |'
        end
        $bridges[i] << '   |'
      end
    end
  end

  $bridges[n * 2 - 4] = $bridges[2]
  $bridges[n * 2 - 3] = '|/| |'
  while $bridges[n * 2 - 3].length != m * 2 - 3
    $bridges[n * 2 - 3] << ' |'
  end
  $bridges[n * 2 - 3] << '\|'
  $bridges[n * 2 - 2] = $bridges[0]
end

def n_five(m)
  for i in 3..9
    $bridges<<('')
  end
  if m == 4
    $bridges[0] = 'o-o-o-o'
    $bridges[1] = '|\| |/|'
    $bridges[2] = 'o o-o o'
    $bridges[3] = '|\   /|'
    $bridges[4] = 'o-o o-o'
    $bridges[5] = '|/   \|'
    $bridges[6] = 'o o-o o'
    $bridges[7] = '|/| |\|'
    $bridges[8] = 'o-o-o-o'
  else
    while $bridges[0].length != m * 2 - 1
      $bridges[0] << '-o'
    end
    while $bridges[1].length != m * 2 - 3
      $bridges[1] << ' |'
    end
    $bridges[1] << '/|'
    while $bridges[2].length != m * 2 - 5
      if $bridges[2].length % 4 == 3
        $bridges[2] << '-o'
      else
        $bridges[2] << ' o'
      end
    end
    $bridges[2] << ' o-o'
    $bridges[3] = '|  /|'
    while $bridges[3].length != m * 2 - 5
      $bridges[3] << ' |'
    end
    $bridges[3] << '\  |'
    $bridges[4] = 'o-o'
    while $bridges[4].length != m * 2 - 1
      if $bridges[4].length % 4 == 3
        $bridges[4] << ' o'
      else
        $bridges[4] << '-o'
      end
    end
    $bridges[5] = '|  \|'
    while $bridges[5].length != m * 2 - 5
      $bridges[5] << ' |'
    end
    $bridges[5] << '/  |'
    $bridges[6] = $bridges[2]
    $bridges[7] = '|/|'
    while $bridges[7].length != m * 2 - 3
      $bridges[7] << ' |'
    end
    $bridges[7] << '\|'
    $bridges[8] = $bridges[0]
  end
end

def n_uneven(m, n)
  while $bridges[0].length != m * 2 - 1
    $bridges[0] << '-o'
  end
  while $bridges[1].length != m * 2 - 3
    $bridges[1] << ' |'
  end
  $bridges[1] << '/|'
  while $bridges[2].length != m * 2 - 1
    if $bridges[2].length % 4 == 3
      $bridges[2] << ' o'
    else
      $bridges[2] << '-o'
    end
  end
  for i in 3..(n * 2 - 1)
    $bridges<<('')
  end
  for i in 3..n
    if i % 2 == 0
      $bridges[i] << $leftislands
      while $bridges[i].length != m * 2 - 3
        if $bridges[i].length % 4 == 3
          $bridges[i] << '-o'
        else
          $bridges[i] << ' o'
        end
      end
      $bridges[i] << '-o'
    else
      if i % 4 == 1
        $bridges[i] << $leftedgealt
        while $bridges[i].length != m * 2 - 1
          $bridges[i] << ' |'
        end
      else
        $bridges[i] << $leftedge
        while $bridges[i].length != m * 2 - 5
          $bridges[i] << ' |'
        end
        $bridges[i] << '   |'
      end
    end
  end
  for i in n..(2 * n - 3)
    $bridges[i] = $bridges[2 * n - i - 2]
  end
  $bridges[n * 2 - 3] = '|/| |'
  while $bridges[n * 2 - 3].length != m * 2 - 3
    $bridges[n * 2 - 3] << ' |'
  end
  $bridges[n * 2 - 3] << '\|'
  $bridges[n * 2 - 2] = $bridges[0]
end

def all_even(m, n)
  while $bridges[0].length != m * 2 - 1
    $bridges[0] << '-o'
  end
  while $bridges[1].length != m * 2 - 3
    $bridges[1] << ' |'
  end
  $bridges[1] << '/|'
  while $bridges[2].length != m * 2 - 1
    if $bridges[2].length % 4 == 3
      $bridges[2] << ' o'
    else
      $bridges[2] << '-o'
    end
  end
  for i in 3..(n * 2 - 1)
    $bridges<<('')
  end
  for i in 3..(n * 2 - 4)
    if i % 2 == 0
      $bridges[i] << $leftislands
      while $bridges[i].length != m * 2 - 3
        if $bridges[i].length % 4 == 3
          $bridges[i] << '-o'
        else
          $bridges[i] << ' o'
        end
      end
      $bridges[i] << '-o'
    else
      if i % 4 == 1
        $bridges[i] << $leftedgealt
        while $bridges[i].length != m * 2 - 1
          $bridges[i] << ' |'
        end
      else
        $bridges[i] << $leftedge
        while $bridges[i].length != m * 2 - 5
          $bridges[i] << ' |'
        end
        $bridges[i] << '   |'
      end
    end
  end
  $bridges[n * 2 - 4] = $bridges[2]
  $bridges[n * 2 - 3] = '|/| |'
  while $bridges[n * 2 - 3].length != m * 2 - 3
    $bridges[n * 2 - 3] << ' |'
  end
  $bridges[n * 2 - 3] << '\|'
  $bridges[n * 2 - 2] = $bridges[0]
end

def main

  m = Integer(ARGV[0])
  n = Integer(ARGV[1])
  fname = ARGV[2]
  if m <= 3 or n <= 3
    out = File.new(fname, "w+")
    out.puts("Imaginary world!..")
    return
  end
  if m % 2 != 0 and n % 2 != 0
    out = File.new(fname, "w+")
    out.puts("Imaginary world!..")
    return
  end
  if m % 2 != 0
    if m == 5
      m_five(n)
    else
      m_uneven(m, n)
    end
  elsif n % 2 != 0
    if n == 5
      n_five(m)
    else
      n_uneven(m, n)
    end
  else
    all_even(m, n)
  end
  out = File.new(fname, "w+")
  for i in 0..$bridges.length
    out.puts($bridges[i])
  end
end

main
