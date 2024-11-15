#include <stdint.h>
#include <stdlib.h>
#include <stdio.h>
#include <string>

#include <iostream>
template<typename T>
class Array {

  private:

    int size1, size2, size3;
    T *elems;
    const char *name;
    int warncount;

  public:

    Array() : size1(0), size2(0), size3(0), elems(0), name("unallocated"), warncount(0) {}
    ~Array() { deallocate_(); }

    void dim(const char *arrayname, int sz1, int sz2 = 1, int sz3 = 1) {
        deallocate_();
        elems = new T [sz1 * sz2 * sz3] ();
        size1 = sz1;
        size2 = sz2;
        size3 = sz3;
        name = arrayname;
    }

    T & operator() (const char *location, int i1) {
        if (i1 < 0 || i1 >= size1) {
            if (++warncount <= 3) {
                std::cerr << location << ": " << name << "(" << i1 << ") out of range\n";
            }
            if (!elems)
                dim("__auto__", 1);
            return elems[0];
        }
        return elems[i1];
    }

    T & operator() (const char *location, int i1, int i2) {
        if (i1 < 0 || i1 >= size1 || i2 < 0 || i2 >= size2) {
            if (++warncount <= 3) {
                std::cerr << location << ": " << name << "(" << i1 << "," << i2 << ") out of range\n";
            }
            if (!elems)
                dim("__auto__", 1);
            return elems[0];
        }
        return elems[i1 * size2 + i2];
    }

    T & operator() (const char *location, int i1, int i2, int i3) {
        if (i1 < 0 || i1 >= size1 || i2 < 0 || i2 >= size2 || i3 < 0 || i3 >= size3) {
            if (++warncount <= 3) {
                std::cerr << location << ": " << name << "(" << i1 << "," << i2 << "," << i3 << ") out of range\n";
            }
            if (!elems)
                dim("__auto__", 1);
            return elems[0];
        }
        return elems[(i1 * size2 + i2) * size3 + i3];
    }

  private:

    void deallocate_() {
      delete[] elems;
      elems = 0;
    }
};
#define LISTINDEX_INVALID -1000
struct ListElement {
    struct ListElement *next;
    struct ListElement *prev;
    /* element data starts here */
};
class LinkedList {
  public:
    struct ListElement *root;
    struct ListElement *current;
    struct ListElement *last;
    int length;
    int index;  /* must recalculate if LISTINDEX_INVALID */
    LinkedList() : root(0), current(0), last(0), length(0), index(-1) {};
    virtual struct ListElement *alloc_elem() = 0;
    virtual void del_elem(struct ListElement *elem) = 0;
};
template <typename T>
class TypedList : public LinkedList {
  public:
    struct ListElement *alloc_elem() {
        char *space = new char [sizeof(struct ListElement) + sizeof(T)];
        /* "placement new" to initialize the data part of the element */
        new (space + sizeof(struct ListElement)) T();
        return reinterpret_cast<struct ListElement *>(space);
    }
    void del_elem(struct ListElement *elem) {
        T *realelem = reinterpret_cast<T *> (elem + 1);
        realelem->~T();
        delete[] reinterpret_cast<char *>(elem);
    }
    ~TypedList() {
        struct ListElement *p;
        while (this->root) {
            p = this->root;
            this->root = p->next;
            this->del_elem(p);
        }
    }
};
#define LIST_CURRENT(list,type) (* (type *) ((list).current + 1))
/* The usual trick of basing offsetof on an offset from the NULL pointer
 * does not work in C++ with classes that have constructors. And because
 * of the use of std::string, the st_ types have constructors.
 * Workaround is to base offsetof on an instance of the class. */
template<typename T>
class empty_wrap {
    public:
    static T empty_T;
};
template <typename T>
T empty_wrap<T>::empty_T;
#define OFFSETOF(STRUCT, FIELD) (int32_t) (((char *) &(empty_wrap<STRUCT>::empty_T.FIELD)) - ((char *) &(empty_wrap<STRUCT>::empty_T)))
struct st_ascii {
	uint8_t f_a;
	st_ascii() : f_a() {};
};
struct st_byte {
	int8_t f_b;
	st_byte() : f_b() {};
};
struct st_character {
	uint8_t f_c;
	st_character() : f_c() {};
};
struct st_double {
	double f_d;
	st_double() : f_d() {};
};
struct st_float {
	float f_f;
	st_float() : f_f() {};
};
struct st_integer {
	intptr_t f_i;
	st_integer() : f_i() {};
};
struct st_long {
	int32_t f_l;
	st_long() : f_l() {};
};
struct st_quad {
	int64_t f_q;
	st_quad() : f_q() {};
};
struct st_unicode {
	uint16_t f_u;
	st_unicode() : f_u() {};
};
struct st_word {
	int16_t f_w;
	st_word() : f_w() {};
};

static const char * data_s[66] = {"blow1.wav", "blow2.wav", "blow3.wav", "blow4.wav", "blow5.wav", "blow6.wav", "blow7.wav", "blow8.wav", "blow9.wav", "blow10.wav", "blow11.wav", "blow12.wav", "blow13.wav", "bow.wav", "chaos.wav", "darkness.wav", "deathcry.wav", "ding.wav", "evasion.wav", "missed.wav", "fall.wav", "flame.wav", "flame2.wav", "gulp.wav", "harp.wav", "holy.wav", "open.wav", "laaa.wav", "moan.wav", "ow.wav", "select.wav", "splash.wav", "splish.wav", "fillup.wav", "success.wav", "wind.wav", "glass.wav", "chicken.wav", "earth.wav", "hohoho.wav", "frog.wav", "cannon.wav", "cannon2.wav", "blackcat.wav", "wolf.wav", "jawa.wav", "metal.wav", "horse.wav", "howl.wav", "huh.wav", "screaming_woman.wav", "roar.wav", "boar.wav", "lightning.wav", "insect.wav", "cracking.wav", "crystal_glass.wav", "power06.wav", "buy.wav", "gold.wav", "gold1.wav", "fireball.wav", "bite.wav", "open_door.wav", "open_chest.wav", ""};
static size_t data_s_pos;
static const size_t DATA_S_MAX = 65;


static int8_t v_failed;
static std::string v_filename;
static int8_t v_haveconsole;
static std::string v_packfile;
static std::string v_path;
static std::string v_srcdir;
static int8_t v_verbose;

#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <unistd.h>
#include <errno.h>

static unsigned char *packfile;
static int32_t packfilesize;
static int packfd = -1;
static void closepack() {
    if (packfd >= 0) {
        close(packfd);
        packfd = -1;
        delete[] packfile;
        packfile = 0;
        packfilesize = 0;
    }
}
static ssize_t fullwrite(int fd, unsigned char *buf, size_t count) {
	size_t n = 0;
	while (n < count) {
		ssize_t r = write(fd, buf + n, count - n);
		if (r < 0 && errno == EINTR)
			continue;
		if (r < 0)
			return r;
		if (r == 0)
			return n;
		n += r;
	}
	return n;
}

static int copyfds(int out_fd, int in_fd, size_t count) {
	unsigned char buf[32768];
	size_t n = 0;
	ssize_t r, r2, maxread;
	while (n < count) {
		if (n + sizeof(buf) <= count) {
			maxread = sizeof(buf);
		} else {
			maxread = count - n;
		}
		r = read(in_fd, buf, maxread);
		if (r < 0 && errno == EINTR)
			continue;
		if (r < 0)
			return r;
		if (r == 0)
			return n;
		r2 = fullwrite(out_fd, buf, r);
		if (r2 < 0)
			return r2;
		if (r2 == 0)
			return n;
		n += r;
	}
	return n;
}

static int putword(int fd, uint32_t w) {
	unsigned char s[4];

	s[0] = w;
	s[1] = w >> 8;
	s[2] = w >> 16;
	s[3] = w >> 24;
	return fullwrite(fd, s, 4) == 4;
}

static int addpackfile(const char *name) {
	int fromfd;
	struct stat statbuf;
	int r;

	if (packfd < 0)
		return 0;
	fromfd = open(name, O_RDONLY);
	if (fromfd < 0)
		return 0;
	/* Get file size */
	if (fstat(fromfd, &statbuf) < 0) {
		close(fromfd);
		return 0;
	}

	/* Go to end to add new file */
	lseek(packfd, 0, SEEK_END);

	/* Store without compression, so compressed and uncompressed sizes
	 * will be the same. */
	putword(packfd, statbuf.st_size);
	putword(packfd, statbuf.st_size);

	r = copyfds(packfd, fromfd, statbuf.st_size);
	close(fromfd);
	if (r != statbuf.st_size)
		return 0;
	return 1;
}

static intptr_t p_addpackfile(std::string p1, intptr_t p2) {
return addpackfile(p1.c_str());

}

static intptr_t p_closepack() {
closepack();
return 1;

}

static intptr_t p_createpack(std::string p1) {
closepack();
packfd = open(p1.c_str(), O_CREAT|O_TRUNC|O_WRONLY, 0666);
return packfd >= 0;

}

static void p_deletefile(std::string p1) {
unlink(p1.c_str());

}

static std::string p_getcurrentdirectory() {
static size_t bufsz = 128;
char *buf = new char[bufsz];
while (!getcwd(buf, bufsz)) {
    if (errno == ERANGE) {
        bufsz *= 2;
        continue;
    }
    delete[] buf;
    return "";
}
std::string s(buf);
delete[] buf;
return s;

}

static intptr_t p_openconsole() {
return 1;

}

static void p_printn(std::string p1) {
puts(p1.c_str());

}

static std::string p_right(std::string p1, intptr_t p2) {
if (p2 >= (int32_t) p1.length())
  return p1;
if (p2 <= 0)
  return "";
return p1.substr(p1.length() - p2);

}


int main() {
	v_packfile = "../sounds.pak";
	v_srcdir = "../sounds/";
	v_haveconsole = 0;
	v_verbose = 0;
	if (p_openconsole()) {
		v_haveconsole = 1;
	}
	if (v_haveconsole && 0) {
		v_verbose = 1;
	}
	if (v_verbose) {
		p_printn("Packer is starting for " + v_packfile + " ...");
	}
	if (!p_createpack(v_packfile)) {
		if (v_haveconsole) {
			p_printn("ERROR: could not create pack file " + v_packfile);
			p_printn("Working directory: " + p_getcurrentdirectory());
		}
		exit(1);
	}
	if (p_right(v_srcdir, 1) != "/") {
		v_srcdir += "/";
	}
	v_filename = "";
	v_failed = 0;
	do {
		v_filename = data_s_pos > DATA_S_MAX ? "" : data_s[data_s_pos++];
		if (v_filename != "") {
			v_path = v_srcdir + v_filename;
			if (p_addpackfile(v_path, 9)) {
				if (v_verbose) {
					p_printn(v_path + " ...successful");
				}
			} else {
				p_printn(v_path + " ...failed");
				v_failed = 1;
			}
		}
	} while (!(v_filename == ""));
	p_closepack();
	if (v_failed) {
		if (v_haveconsole) {
			p_printn("ERROR: could not build complete .pak file");
			p_printn("Working directory: " + p_getcurrentdirectory());
			p_printn("Source directory: " + v_srcdir);
			p_printn("Pack file: " + v_packfile);
		}
		p_deletefile(v_packfile);
		exit(1);
	}
	if (v_verbose) {
		p_printn(v_packfile + " was created");
	}
	if (v_haveconsole && 0) {
	}
	exit(0);
	return 0;
}

