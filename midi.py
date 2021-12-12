from mido import MidiFile
import mido


songName = 'Rick_Astley_-_Never_Gonna_Give_You_Up.mid'

mid = MidiFile(songName)


id = 0

note_list = []

note_time_list = []

note_time_list.append(0)


for entries in mid.tracks[10]:

     if not entries.is_meta:

          ent = str(entries).split(' ')

          print(str(entries))

          if len(ent) == 5:

               if(ent[0] == 'note_on'):

                    note = ent[2].split('=')[1]

                    time = ent[4].split('=')[1]

                    note_time_list[id] = int(mido.tick2second((note_time_list[id] + int(time)), 192, 526316)*1000)

                    n = int(note)

                    note_list.append(n)

                    id = id + 1

                    note_time_list.append(0)

               else:

                    time = ent[3].split('=')[1]

                    note_time_list[id] = note_time_list[id] + int(time)


note_time_list.remove(note_time_list[len(note_time_list) - 1])

print('timeLen:'+str(len(note_time_list)))

print('noteLen:'+str(len(note_list)))

print(note_time_list)

print(note_list)

print('ticks_per_beat:', mid.ticks_per_beat)

for track in mid.tracks:
    for msg in track:
        if msg.type == 'set_tempo':
            print('Tempo:', msg.tempo)
