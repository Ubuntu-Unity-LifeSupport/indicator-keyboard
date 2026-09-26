/*
 * Copyright 2026 Ubuntu Unity Life Support
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, version 3 of the License.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

/*
 * The xkb layouts of an AccountsService InputSources value (aa{ss}), in
 * order. AccountsService returns NULL while it has no value cached for the
 * user, for instance while accounts-daemon restarts, and iterating that
 * crashed the service (LP: #2166139).
 */
string[] get_xkb_input_sources (Variant? input_sources) {
	string[] sources = {};

	if (input_sources == null) {
		return sources;
	}

	foreach (var outer in (!) input_sources) {
		foreach (var inner in (!) outer) {
			unowned string key;
			unowned string source;

			((!) inner).get ("{&s&s}", out key, out source);

			if (key == "xkb") {
				sources += source;
			}
		}
	}

	return sources;
}
